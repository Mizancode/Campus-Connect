class Job {
  String jobTitle;
  String companyName;
  String salary;
  String description;
  String aboutRole;
  List<String> requirements;
  String imageUrl;
  String type;

  Job({
    required this.jobTitle,
    required this.companyName,
    required this.salary,
    required this.description,
    required this.aboutRole,
    required this.requirements,
    required this.imageUrl,
    required this.type,
  });
}

List<Job> jobList = [
  Job(
    jobTitle: 'Software Engineer',
    companyName: 'Tech Solutions Inc.',
    salary: '₹6,00,000 - ₹8,00,000/yr',
    description: 'Develop and maintain software applications.',
    aboutRole: 'You will be responsible for writing clean, scalable code using programming languages like Java and Python.',
    requirements: [
      '* Bachelor’s degree in Computer Science or related field.',
      '* Proficiency in Java, Python, or C++.',
      '* Good understanding of software development lifecycle.',
      '* Strong problem-solving skills.',
    ],
    imageUrl: 'assets/svg/Company.svg',
    type: 'Full Time'
  ),
  Job(
    jobTitle: 'Data Analyst',
    companyName: 'Analytics Hub',
    salary: '₹4,50,000 - ₹6,00,000/yr',
    description: 'Analyze data to help the company make informed decisions.',
    aboutRole: 'You will work with large datasets, analyze trends, and provide actionable insights to stakeholders.',
    requirements: [
      '* Bachelor’s degree in Statistics, Mathematics, or related field.',
      '* Experience with data analysis tools such as Excel, SQL, or Python.',
      '* Strong analytical skills and attention to detail.',
      '* Ability to communicate complex data insights clearly.',
    ],
    imageUrl: 'assets/svg/Company.svg',
    type: 'Part Time'
  ),
  Job(
    jobTitle: 'Web Developer',
    companyName: 'Creative Web Agency',
    salary: '₹5,00,000 - ₹7,00,000/yr',
    description: 'Create and maintain user-friendly web interfaces.',
    aboutRole: 'You will be working closely with designers and back-end developers to implement responsive web designs.',
    requirements: [
      '* Bachelor’s degree in Computer Science or related field.',
      '* Proficiency in HTML, CSS, and JavaScript.',
      '* Experience with frameworks like React or Angular.',
      '* Strong attention to detail and design aesthetics.',
    ],
    imageUrl: 'assets/svg/Company.svg',
    type: 'Full Time'
  ),
  Job(
    jobTitle: 'Data Scientist',
    companyName: 'Data Innovations',
    salary: '₹8,00,000 - ₹12,00,000/yr',
    description: 'Use data to build models and drive decision-making processes.',
    aboutRole: 'You will be responsible for building predictive models, conducting experiments, and collaborating with cross-functional teams.',
    requirements: [
      '* Bachelor’s or Master’s degree in Computer Science, Statistics, or related field.',
      '* Experience with machine learning algorithms and tools.',
      '* Proficiency in Python, R, or similar programming languages.',
      '* Strong statistical and analytical skills.',
    ],
    imageUrl: 'assets/svg/Company.svg',
    type: 'Full Time'
  ),
];
