package com.dziennik.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.*;
import java.util.Date;

@Entity
@NamedQueries({
    @NamedQuery(name = "comment.all", query = "select c from Comment c order by c.id")
})
public class Comment implements Serializable{
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String type;
		private String message;
	    private String author;

	    @Temporal(TemporalType.DATE)
	    private Date createdAt;

	    public Comment() {
	        super();
	    }

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
	    }

	    public String getAuthor() {
	        return author;
	    }

	    public void setAuthor(String author) {
	        this.author = author;
	    }

	    public Date getCreatedAt() {
	        return createdAt;
	    }

	    public void setCreatedAt(Date createdAt) {
	        this.createdAt = createdAt;
	    }
	    public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}
}
