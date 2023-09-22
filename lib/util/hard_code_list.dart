import 'package:job/job/job_list.dart';
import 'package:job/profile/profile_list.dart';

String firstName = 'bob';
String lastName = 'tan';
String userEmail = 'bobtan@gmail.com';
String password = '12345';

List<JobList> jobLists = [
  JobList(
    id: 1,
    title: "Senior Product Desginer",
    description:
        "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers ensuring they are not only visually stunning but also highly functional and user-friendly.",
    active: true,
    location: "East, Singapore",
    postedAt: "2020-09-09T14:30:00Z",
    company: "Slack",
    minSalary: 6000,
    maxSalary: 8000,
    requirements: [
      "Lead the design process from concept to execution, setting the creative vision for the product and guiding the design team to achieve it.",
      "Place users at the center of the design process by conducting user research, gathering feedback, and creating intuitive and accessible user interfaces.",
      "Develop interactive prototypes to test and validate design concepts, making data-driven decisions to improve the product's usability."
    ],
    image: "assets/image/slack.png",
  ),
  JobList(
    id: 2,
    title: "Front-End Developer",
    description:
        "As a Front-End Developer, you will play a crucial role in shaping the user experience of our digital products. You will be responsible for creating visually appealing, responsive, and interactive web interfaces that engage and delight our users. Your expertise in HTML, CSS, and JavaScript will be essential in turning design concepts into seamless and functional user interfaces.",
    active: true,
    postedAt: "2020-09-09T14:30:00Z",
    location: "Central, Singapore",
    company: "Crypto.com",
    minSalary: 5000,
    maxSalary: 6000,
    requirements: [
      "Collaborate with designers to translate mockups and wireframes into responsive web pages. Write clean, efficient, and cross-browser compatible HTML, CSS, and JavaScript code.",
      " Implement user-friendly and intuitive UI elements, ensuring a consistent and visually appealing design across all web platforms.",
      "Create responsive layouts that adapt to various screen sizes and devices, ensuring a consistent and enjoyable user experience on desktops, tablets, and mobile devices."
    ],
    image: "assets/image/crypto.jpg",
  ),
  JobList(
    id: 3,
    title: "Product Owner",
    description:
        "A Product Owner is a pivotal role within the realm of product development and project management. Their primary responsibility is to bridge the gap between the business stakeholders, users, and the development team to ensure that a product or project is delivered successfully.",
    active: true,
    postedAt: "2020-09-07T14:30:00Z",
    location: "West, Singapore",
    company: "Amazon",
    minSalary: 8000,
    maxSalary: 10000,
    requirements: [
      "Collaborate with stakeholders, including customers, business leaders, and end-users, to collect and analyze requirements, user stories, and feedback.",
      "Develop a clear and compelling product vision, setting the direction for the product's development and aligning it with business goals and user needs.",
      "Create and maintain a prioritized product backlog that outlines the features and user stories to be developed, keeping it updated as requirements evolve."
    ],
    image: "assets/image/amazon.png",
  ),
  JobList(
    id: 4,
    title: "Business Analyst",
    description:
        "A Business Analyst (BA) is a crucial role within organizations, responsible for bridging the gap between business objectives and technological solutions. BAs play a pivotal role in identifying business needs, assessing processes, and translating them into functional requirements for IT teams to implement. They are adept at data analysis, problem-solving, and communication, facilitating the smooth execution of projects and the achievement of business goals.",
    active: true,
    postedAt: "2020-09-06T14:30:00Z",
    location: "North-East, Singapore",
    company: "Asana",
    minSalary: 7000,
    maxSalary: 8000,
    requirements: [
      "Collaborate with stakeholders, including management, end-users, and IT teams, to elicit and document business requirements. This involves conducting interviews, workshops, and surveys to gain insights into organizational needs.",
      " Analyze data to identify trends, patterns, and opportunities for process improvements. BAs use various tools and techniques to interpret data and make informed recommendations.",
      " Create detailed and clear documentation, including business requirement documents (BRDs), functional requirement documents (FRDs), use cases, and process flow diagrams, to convey requirements to development and testing teams."
    ],
    image: "assets/image/asana.png",
  ),
  JobList(
    id: 5,
    title: "Senior Product Designer",
    description:
        "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers  ensuring they are not only visually stunning but also highly functional and user-friendly.",
    active: true,
    postedAt: "2020-09-06T14:30:00Z",
    location: "Google",
    company: "Central, Singapore",
    minSalary: 6000,
    maxSalary: 8000,
    requirements: [
      "Lead the design process from concept to execution, setting the creative vision for the product and guiding the design team to achieve it.",
      "Place users at the center of the design process by conducting user research, gathering feedback, and creating intuitive and accessible user interfaces.",
      "Develop interactive prototypes to test and validate design concepts, making data-driven decisions to improve the product's usability."
    ],
    image: "assets/image/google.png",
  ),
];

List<ProfileList> profiles = [
  ProfileList(
    firstName: "Adrian",
    lastName: "Severin",
    email: "Adrianseverin@gmail.com",
    mobileNumber: "+6594717281",
    skills: ["figma"],
    resumeList: [
      Resumes(
          name: "sample.pdf",
          fileLocation: "documents/pdf/sample.pdf",
          uploadDate: "2020-06-11T14:30:00Z")
    ],
    coverList: [
      CoverLetter(
          name: "dummy.pdf",
          fileLocation: "documents/pdf/dummy.pdf",
          uploadDate: "2020-06-11T14:30:00Z"),
      CoverLetter(
          name: "My Cover letter.doc",
          fileLocation: "documents/pdf/dummy.pdf",
          uploadDate: "2020-06-06T14:30:00Z")
    ],
    appliedList: [1, 3],
    image: "assets/image/person.jpg",
  ),
];
