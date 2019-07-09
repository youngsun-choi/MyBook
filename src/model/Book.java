package model;

public class Book {
	private String title;
    private String link;
    private String image;
    private String author;
    private String price;
    private String discount;
    private String publisher;
    private String pubdate;
    private String isbn;
    private String description;
    
    public String getTitle() {
		return title;
	}
	public String getLink() {
		return link;
	}
	public String getImage() {
		return image;
	}
	public String getAuthor() {
		return author;
	}
	public String getPrice() {
		return price;
	}
	public String getDiscount() {
		return discount;
	}
	public String getPublisher() {
		return publisher;
	}
	public String getPubdate() {
		return pubdate;
	}
	public String getIsbn() {
		return isbn;
	}
	public String getDescription() {
		return description;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
    @Override
    public String toString() {
        return "Book [title=" + title + ", link=" + link + ", image=" + image + ", author=" + author + ", price=" + price
                + ", discount=" + discount + ", publisher=" + publisher + ", pubdate=" + pubdate + ", isbn=" + isbn
                + ", description=" + description + "]";
    }
}
