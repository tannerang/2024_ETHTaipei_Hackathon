import {
  benefitIcon1,
  benefitIcon2,
  benefitIcon3,
  benefitIcon4,
  benefitImage2,
  chromecast,
  disc02,
  discord,
  discordBlack,
  facebook,
  figma,
  file02,
  framer,
  homeSmile,
  instagram,
  notification2,
  notification3,
  notification4,
  notion,
  photoshop,
  plusSquare,
  protopie,
  raindrop,
  recording01,
  recording03,
  roadmap1,
  roadmap2,
  roadmap3,
  roadmap4,
  searchMd,
  slack,
  sliders04,
  telegram,
  twitter,
  yourlogo,
  dysonLogo,
  aliens,
  anon,
  crystal,
  defrogs,
  mystcl,
  pandora,
  rug,
  yes,
  beans,
  amm,
} from "../assets";

export const navigation = [
  {
    id: "0",
    title: "Features",
    url: "#features",
  },
  {
    id: "1",
    title: "Ecosystem",
    url: "#ecosystem",
  },
  {
    id: "2",
    title: "Service",
    url: "#service",
  },
  {
    id: "3",
    title: "Launchpad",
    url: "#launchpad",
  },
  {
    id: "4",
    title: "Roadmap",
    url: "#roadmap",
  },
  {
    id: "5",
    title: "Sign in",
    url: "#login",
    onlyMobile: true,
  },
];

export const heroIcons = [homeSmile, file02, searchMd, plusSquare];

export const notificationImages = [notification4, notification3, notification2];

export const companyLogos = [yourlogo, yourlogo, yourlogo, yourlogo, yourlogo];

export const dysonLogos = [
  dysonLogo,
  dysonLogo,
  dysonLogo,
  dysonLogo,
  dysonLogo,
];

export const arrorServices = [
  "Customize logo",
  "Unleash creativity",
  "Enhance consensus",
];

export const arrorServicesIcons = [
  recording03,
  recording01,
  disc02,
  chromecast,
  sliders04,
];

export const roadmap = [
  {
    id: "0",
    title: "Swap in Dyson Finance",
    text: "Enable all the traders to buy from and sell to the Dyson Finance AMM, making it easier for users to interact with the app hands-free.",
    date: "Apr 2024",
    status: "progress",
    imageUrl: amm,
    colorful: true,
  },
  {
    id: "1",
    title: "Gamification",
    text: "Add Game-Fi elements, such as pooling together or Play-to-Earn, to incentivize users to interact with the platform more frequently.",
    date: "May 2024",
    status: "progress",
    imageUrl: roadmap2,
  },
];

export const collabText =
  "With smart automation and top-notch security, it's the perfect solution for teams looking to work smarter.";

export const collabContent = [
  {
    id: "0",
    title: "Seamless Integration",
    text: collabText,
  },
  {
    id: "1",
    title: "Smart Automation",
  },
  {
    id: "2",
    title: "Top-notch Security",
  },
];

export const collabApps = [
  {
    id: "0",
    title: "Pandora",
    icon: pandora,
    width: 48,
    height: 48,
  },
  {
    id: "1",
    title: "Aliens",
    icon: aliens,
    width: 34,
    height: 34,
  },
  {
    id: "2",
    title: "Anon",
    icon: anon,
    width: 34,
    height: 34,
  },
  {
    id: "3",
    title: "Crystal",
    icon: crystal,
    width: 34,
    height: 35,
  },
  {
    id: "4",
    title: "Defrogs",
    icon: defrogs,
    width: 34,
    height: 34,
  },
  {
    id: "5",
    title: "Mystcl",
    icon: mystcl,
    width: 34,
    height: 34,
  },
  {
    id: "6",
    title: "Rug",
    icon: rug,
    width: 34,
    height: 34,
  },
  {
    id: "7",
    title: "Beans",
    icon: beans,
    width: 34,
    height: 34,
  },
];

export const pricing = [
  {
    id: "0",
    title: "Basic",
    description: "AI chatbot, personalized recommendations",
    price: "0",
    features: [
      "An AI chatbot that can understand your queries",
      "Personalized recommendations based on your preferences",
      "Ability to explore the app and its features without any cost",
    ],
  },
  {
    id: "1",
    title: "Premium",
    description: "Advanced AI chatbot, priority support, analytics dashboard",
    price: "9.99",
    features: [
      "An advanced AI chatbot that can understand complex queries",
      "An analytics dashboard to track your conversations",
      "Priority support to solve issues quickly",
    ],
  },
  {
    id: "2",
    title: "Enterprise",
    description: "Custom AI chatbot, advanced analytics, dedicated account",
    price: null,
    features: [
      "An AI chatbot that can understand your queries",
      "Personalized recommendations based on your preferences",
      "Ability to explore the app and its features without any cost",
    ],
  },
];

export const benefits = [
  {
    id: "0",
    title: "Ask anything",
    text: "Lets users quickly find answers to their questions without having to search through multiple sources.",
    backgroundUrl: "assets/benefits/card-1.svg",
    iconUrl: benefitIcon1,
    imageUrl: benefitImage2,
  },
  {
    id: "1",
    title: "Improve everyday",
    text: "The app uses natural language processing to understand user queries and provide accurate and relevant responses.",
    backgroundUrl: "assets/benefits/card-2.svg",
    iconUrl: benefitIcon2,
    imageUrl: benefitImage2,
    light: true,
  },
  {
    id: "2",
    title: "Connect everywhere",
    text: "Connect with the AI chatbot from anywhere, on any device, making it more accessible and convenient.",
    backgroundUrl: "assets/benefits/card-3.svg",
    iconUrl: benefitIcon3,
    imageUrl: benefitImage2,
  },
  {
    id: "3",
    title: "Fast responding",
    text: "Lets users quickly find answers to their questions without having to search through multiple sources.",
    backgroundUrl: "assets/benefits/card-4.svg",
    iconUrl: benefitIcon4,
    imageUrl: benefitImage2,
    light: true,
  },
  {
    id: "4",
    title: "Ask anything",
    text: "Lets users quickly find answers to their questions without having to search through multiple sources.",
    backgroundUrl: "assets/benefits/card-5.svg",
    iconUrl: benefitIcon1,
    imageUrl: benefitImage2,
  },
  {
    id: "5",
    title: "Improve everyday",
    text: "The app uses natural language processing to understand user queries and provide accurate and relevant responses.",
    backgroundUrl: "assets/benefits/card-6.svg",
    iconUrl: benefitIcon2,
    imageUrl: benefitImage2,
  },
];

export const socials = [
  {
    id: "0",
    title: "Discord",
    iconUrl: discordBlack,
    url: "https://discord.gg/TZpqEncpnh",
  },
  {
    id: "1",
    title: "Twitter",
    iconUrl: twitter,
    url: "https://twitter.com/DysonFinance",
  },
  {
    id: "2",
    title: "Telegram",
    iconUrl: telegram,
    url: "https://t.me/DysonFinance",
  },
];
