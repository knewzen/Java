package Networking;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServerListOUT implements Runnable {

    private DatagramSocket socket;
    private boolean keepAlive;
    public void stop() {
        keepAlive = false;
        socket.close();
    }
    @Override
    public void run() {
        keepAlive = true;
        try {
            if (socket == null) {
                socket = new DatagramSocket(Server.PORT, InetAddress.getByName("0.0.0.0"));
                socket.setBroadcast(true);
            }
            
            while (keepAlive) {
                System.out.println(getClass().getName() + ">>>Ready to receive broadcast packets!");
                
                //Receive a packet
                byte[] recvBuf = new byte[15000];
                DatagramPacket packet = new DatagramPacket(recvBuf, recvBuf.length);
                socket.receive(packet);
                
                System.out.println(getClass().getName() + ">>>Discovery packet received from: " + packet.getAddress().getHostAddress());
                System.out.println(getClass().getName() + ">>>Packet received; data: " + new String(packet.getData()));
                
                String message = new String(packet.getData()).trim();
                if (message.equals("DISCOVER_FUIFSERVER_REQUEST")) {
                    byte[] sendData = "DISCOVER_FUIFSERVER_RESPONSE".getBytes();
                    
                    DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, packet.getAddress(), packet.getPort());
                    socket.send(sendPacket);
                    
                    System.out.println(getClass().getName() + ">>>Sent packet to: " + sendPacket.getAddress().getHostAddress());
                }
            }
        } catch (IOException ex) {
            System.out.println(ex);
        }
        socket = null;
    }
}