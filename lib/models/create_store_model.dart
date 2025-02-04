class StoreDetails {
  final String title;
  final String step;
  final String subtext;
  final String btnContent;

  StoreDetails(
      {required this.title,
      required this.step,
      required this.subtext,
      required this.btnContent});
}

class CreateStoreBrain {
  final List<StoreDetails> createstoresData = [
    StoreDetails(
        title: 'Store Name',
        step: '1',
        subtext:
            'Give your store a name that is easy to remember by your customers!',
        btnContent: 'Next-Store Details'),
    StoreDetails(
        title: 'Store Details',
        step: '2',
        subtext:
            'Give more details to your store to allow for easy categorization!',
        btnContent: 'Next-Customization'),
    StoreDetails(
        title: 'Customize Store',
        step: '3',
        subtext:
            'Give more details to your store to allow for easy categorization!',
        btnContent: 'Next-Your First Product'),
    StoreDetails(
        title: 'Add Your First Product',
        step: '4',
        subtext:
            'Create your inventory for your fist product by entering its details and availability!',
        btnContent: 'Create Your Store'),
  ];
}
