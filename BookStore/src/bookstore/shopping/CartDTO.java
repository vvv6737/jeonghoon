package bookstore.shopping;

public class CartDTO {

	private	int		cart_id;	//장바구니 아이디
	private	String	buyer;		//구매자 아이디
	private	int		book_id;	//장바구니에 담은 책의 아이디
	private	String	book_title;	//장바구니에 담은 책의 제목
	private	int		buy_price;	//장바구니에 담은 책의 구매가
	private	int		buy_count;	//장바구니에 담은 책의 수량
	private	String	book_image;	//장바구니에 담은 책의 이미지명
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", buyer=" + buyer + ", book_id=" + book_id + ", book_title="
				+ book_title + ", buy_price=" + buy_price + ", buy_count=" + buy_count + ", book_image=" + book_image
				+ "]";
	}
	
}


