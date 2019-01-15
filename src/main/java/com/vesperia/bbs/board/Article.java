package com.vesperia.bbs.board;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity
@EqualsAndHashCode(of = "title")
@ToString
public class Article {
	@Id
	@GeneratedValue
	private Long id;

	@Column(nullable = false, length=50)
	private String title;

	@Column(nullable = false, length=50)
	private String author;

	@Column(columnDefinition = "TEXT", nullable = false)
	private String content;
	
	@CreationTimestamp
	private Date regdate;

	@UpdateTimestamp
	private Date updatedate;
	
	@Column(nullable = false)
	private Long viewcount;
	
	@Builder
	public Article(String title, String author, String content) {
		this.title = title;
		this.author = author;
		this.content = content;
	}
}
