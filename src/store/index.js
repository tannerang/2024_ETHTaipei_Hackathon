import { proxy } from "valtio";

const state = proxy({
  intro: true,
  color: "#EFBD48",
  isLogoTexture: true,
  isFullTexture: false,
  logoDecal: "../assets/arrorLogo.png",
  fullDecal: "../assets/arrorLogo.png",
});

export default state;
