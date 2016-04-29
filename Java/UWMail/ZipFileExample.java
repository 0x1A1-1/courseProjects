/*
 * Invoke this file as: 
 *   javac ZipFileExample.java
 *   java ZipFileExample yourZipInput.zip
 */

import java.util.zip.ZipFile;
import java.util.zip.ZipEntry;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.io.InputStream;
import java.util.Scanner;
import java.io.IOException;
import java.util.zip.ZipException;

public class ZipFileExample {
	public static void main(String args[]) {
		if (args.length != 1) {
			System.exit(1);
		} else {
			try (ZipFile zf = new ZipFile(args[0]);) {
				// follow this approach for using <? extends ZipEntry>, even
				// though we will not cover this in class.
				Enumeration<? extends ZipEntry> entries = zf.entries();
				while (entries.hasMoreElements()) {
					ZipEntry ze = entries.nextElement();
					if (ze.getName().endsWith(".txt")) {
						InputStream in = zf.getInputStream(ze);
						Scanner sc = new Scanner(in);
						System.out.println(ze.getName());
						System.out.println("-----------------------------");
						 while(sc.hasNextLine()) {
						 String line = sc.nextLine();
						 System.out.println("  " + line);
						 }
//						String line = sc.nextLine();
//						String replyTo = null;
//						Date date;
//						String messageID;
//						String subject;
//						String from;
//						String to;
//						DoublyLinkedList<String> body = new DoublyLinkedList<String>();
//						DoublyLinkedList<String> reference = new DoublyLinkedList<String>();
//						Email newmail;
//						if (line.contains("In-Reply-To")) {
//							replyTo = line.substring("In-Reply-To: ".length());
//							line = sc.nextLine();
//							reference.add(line.substring("References: "
//									.length()));
//							line = sc.nextLine();
//						}
//						date = new Date(line.substring("Date: ".length()));
//						line = sc.nextLine();
//						messageID = line.substring("Message-ID: ".length());
//						line = sc.nextLine();
//						subject = line.substring("Subject: ".length());
//						line = sc.nextLine();
//						from = line.substring("From: ".length());
//						line = sc.nextLine();
//						to = line.substring("To: ".length());
//
//						while (sc.hasNextLine()) {
//							body.add(sc.nextLine());
//						}
//						if (replyTo == null) {
//							newmail = new Email(date, messageID, subject,
//									from, to, body);
//						} else {
//							newmail = new Email(date, messageID, subject,
//									from, to, body, replyTo, reference);
//						}
					}
				}
			} catch (ZipException e) {
				System.out
						.println("A .zip format error has occurred for the file.");
				System.exit(1);
			} catch (IOException e) {
				System.out.println("An I/O error has occurred for the file.");
				System.exit(1);
			} catch (SecurityException e) {
				System.out
						.println("Unable to obtain read access for the file.");
				System.exit(1);
			}
		}
	}
}
