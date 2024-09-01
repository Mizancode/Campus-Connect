class ChatMessage {
  static String getMessage(String userMessage) {
    if (userMessage.toLowerCase().contains('hello')) {
      return 'Hi! How can I help you today?';
    } else if (userMessage.toLowerCase().contains('how are you')) {
      return 'I\'m doing great! How about you?';
    } else if (userMessage.toLowerCase().contains('i\'m fine too')) {
      return 'Good, how can I help you?';
    } else if (userMessage
        .toLowerCase()
        .contains('i have applied for the job through campus connect')) {
      return 'That\'s sound good, you will receive interview mail shortly';
    } else if (userMessage
        .toLowerCase()
        .contains('that\'s great to hear that, thank you')) {
      return 'You are Welcome';
    } else if (userMessage
        .toLowerCase()
        .contains('can you tell me more about the role')) {
      return 'Sure! The role involves developing scalable applications using Flutter.';
    } else if (userMessage
        .toLowerCase()
        .contains('what are the required qualifications')) {
      return 'We are looking for candidates with a strong foundation in Data Structures, Algorithms, and experience in Flutter development.';
    } else if (userMessage
        .toLowerCase()
        .contains('what is the interview process like')) {
      return 'The interview process includes an initial technical screening followed by an HR round.';
    } else if (userMessage
        .toLowerCase()
        .contains('when can i expect feedback')) {
      return 'You can expect feedback within a week after the interview.';
    } else if (userMessage
        .toLowerCase()
        .contains('thank you for the information')) {
      return 'You’re welcome! Feel free to reach out if you have any more questions.';
    } else if (userMessage
        .toLowerCase()
        .contains('can i apply for multiple positions')) {
      return 'Yes, you can apply for multiple positions that match your skills and interests.';
    } else if (userMessage.toLowerCase().contains('what are the next steps')) {
      return 'The next steps involve shortlisting candidates, followed by interview invitations.';
    } else if (userMessage
        .toLowerCase()
        .contains('what is the company culture like')) {
      return 'Our company culture is focused on innovation, teamwork, and continuous learning.';
    } else if (userMessage
        .toLowerCase()
        .contains('will there be coding tests')) {
      return 'Yes, there will be coding tests as part of the technical interview process.';
    } else if (userMessage
        .toLowerCase()
        .contains('is there any relocation assistance')) {
      return 'Yes, we provide relocation assistance for candidates who are moving to a different city.';
    } else {
      return 'I\'m not sure about that, but I can connect you with someone who can help.Have a nice talking to you, Good Bye!';
    }
  }
}
