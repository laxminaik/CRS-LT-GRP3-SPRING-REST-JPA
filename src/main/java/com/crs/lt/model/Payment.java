package com.crs.lt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "payment")
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="referenceId")
	private String invoiceID;
	@Column(name = "amount")
	private float fee;
	@Column(name = "status")
	private boolean status;
	@Column(name = "modeOfPayment")
	private String modeOfPayment;
  
	String studentId;

	public Payment(String invoiceID, float fee, boolean status, String modeOfPayment, String studentId) {
		super();
		this.invoiceID = invoiceID;
		this.fee = fee;
		this.status = status;
		this.modeOfPayment = modeOfPayment;
		this.studentId = studentId;
	}

	public String getInvoiceID() {
		return invoiceID;
	}

	public void setInvoiceID(String invoiceID) {
		this.invoiceID = invoiceID;
	}

	public float getFee() {
		return fee;
	}

	public void setFee(float fee) {
		this.fee = fee;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	
	
}
