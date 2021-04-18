namespace API.Dtos
{
    public class OrderItemDto
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string PictureUrl { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
    }
}