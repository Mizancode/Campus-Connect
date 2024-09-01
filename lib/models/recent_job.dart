class RecentJob {
  String jobTitle;
  String companyName;
  String salary;
  String postDate; // Date when the job was posted
  String description;
  String aboutRole;
  List<String> requirements;
  String imageUrl;
  String type;

  RecentJob(
      {required this.jobTitle,
      required this.companyName,
      required this.salary,
      required this.postDate,
      required this.description,
      required this.aboutRole,
      required this.requirements,
      required this.imageUrl,
      required this.type});
}

List<RecentJob> recentJobList = [
  RecentJob(
      jobTitle: 'Full Stack Developer',
      companyName: 'Innovative Tech Co.',
      salary: '₹7,00,000 - ₹10,00,000/yr',
      postDate: '2024-08-20',
      description:
          'Work on both front-end and back-end development of web applications.',
      aboutRole:
          'You will be responsible for developing and maintaining web applications, collaborating with designers, and ensuring cross-platform optimization.',
      requirements: [
        '* Bachelor’s degree in Computer Science or related field.',
        '* Experience with front-end technologies like React or Angular.',
        '* Proficiency in back-end languages like Node.js or Django.',
        '* Understanding of database management systems.',
      ],
      imageUrl: 'assets/svg/Recent_Job.svg',
      type: 'Full Time'),
  RecentJob(
      jobTitle: 'Business Intelligence',
      companyName: 'DataDriven Solutions',
      salary: '₹5,50,000 - ₹7,50,000/yr',
      postDate: '2024-08-18',
      description:
          'Analyze data and generate reports to support business decisions.',
      aboutRole:
          'You will work closely with management to identify business needs and translate them into actionable insights using data visualization tools.',
      requirements: [
        '* Bachelor’s degree in Business, Economics, or related field.',
        '* Proficiency in SQL and data visualization tools like Tableau or Power BI.',
        '* Strong analytical skills and attention to detail.',
        '* Ability to communicate effectively with non-technical stakeholders.',
      ],
      imageUrl: 'assets/svg/Recent_Job.svg',
      type: 'Part Time'),
  RecentJob(
      jobTitle: 'Mobile App Developer',
      companyName: 'AppCreators Ltd.',
      salary: '₹6,00,000 - ₹9,00,000/yr',
      postDate: '2024-08-15',
      description:
          'Design and develop mobile applications for Android and iOS.',
      aboutRole:
          'You will be working on creating high-quality mobile applications, ensuring optimal performance, and integrating with APIs.',
      requirements: [
        '* Bachelor’s degree in Computer Science or related field.',
        '* Experience in developing mobile apps using Flutter or React Native.',
        '* Understanding of mobile app architecture and design patterns.',
        '* Ability to work in an Agile environment.',
      ],
      imageUrl: 'assets/svg/Recent_Job.svg',
      type: 'Full Time'),
  RecentJob(
      jobTitle: 'Data Engineer',
      companyName: 'TechData Corp.',
      salary: '₹7,50,000 - ₹11,00,000/yr',
      postDate: '2024-08-12',
      description:
          'Build and maintain data pipelines to support data analysis and reporting.',
      aboutRole:
          'You will be responsible for designing, implementing, and optimizing data pipelines, ensuring data quality, and collaborating with data scientists.',
      requirements: [
        '* Bachelor’s degree in Computer Science, Information Technology, or related field.',
        '* Proficiency in SQL and experience with data pipeline tools.',
        '* Experience with cloud platforms like AWS or Azure.',
        '* Strong problem-solving and communication skills.',
      ],
      imageUrl: 'assets/svg/Recent_Job.svg',
      type: 'Part Time'),
];
