
String getIcon({index,isSelected}) {
  switch (index) {
    case 0:
      return isSelected ? 'assets/images/tabler-icon-smart-home w.png' : 'assets/images/tabler-icon-smart-home.png';
    case 1:
      return isSelected ? 'assets/images/tabler-icon-shopping-cart-minus w.png' : 'assets/images/tabler-icon-shopping-cart-minus.png';
    case 2:
      return isSelected ? 'assets/images/tabler-icon-heart w.png' : 'assets/images/tabler-icon-heart.png';
    case 3:
      return isSelected ? 'assets/images/tabler-icon-award w.png' : 'assets/images/tabler-icon-award.png';
    case 4:
      return isSelected ? 'assets/images/tabler-icon-user-circle w.png' : 'assets/images/tabler-icon-user-circle.png';
    default:
      return isSelected ? 'assets/images/tabler-icon-smart-home w.png' : 'assets/images/tabler-icon-smart-home.png';
  }
}
