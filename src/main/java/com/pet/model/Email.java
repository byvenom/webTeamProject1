package com.pet.model;
import javax.mail.internet.MimeMessage;

public interface Email {

	public MimeMessage anserMail();

	public void send(MimeMessage message);

	public MimeMessage createMimeMessage();


}