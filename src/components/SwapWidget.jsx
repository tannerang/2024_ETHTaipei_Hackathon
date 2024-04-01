import CompanyLogos from "./CompanyLogos";
import Section from "./Section";
import Heading from "./Heading";
import {
  service1,
  service2,
  service3,
  check,
  arrorLogo,
  loading2,
  XYFinance,
  XYLogo,
} from "../assets";
import { arrorServices, arrorServicesIcons, swapServices } from "../constants";
import {
  PhotoChatMessage,
  Gradient,
  VideoBar,
  VideoChatMessage,
} from "./design/Services";
import Generating from "./Generating";
import { motion, AnimatePresence } from "framer-motion";
import { useSnapshot } from "valtio";
import {
  headContainerAnimation,
  headContentAnimation,
  headTextAnimation,
  slideAnimation,
} from "../config/motion";

import { XSwapWidget } from "@xyfinance/widget";

const SwapWidget = () => {
  const config = {
    disabledChains: [],
    fromInput: "0.1",
    fromToken: {
      address: "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE",
      chainId: "1",
    },
    toToken: {
      address: "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE",
      chainId: "56",
    },
    referrer: "0xFD19727868A8197F42e7a52d024374598F62953B",
    featuredTokens: [
      {
        address: "0x666666661f9B6D8c581602AAa2f76cbead06C401",
        chainId: "56",
      },
    ],
  };

  const theme = {
    mode: "dark",
    fontFamily: "Sora",
    borderRadius: {
      container: "16px",
      inner: "12px",
      button: "32px",
    },
    colors: {
      primary: "#AC6AFF",
      gradient: ["#AC6AFF", "#858DFF"],
    },
    components: {
      button: {
        variant: "gradient",
      },
    },
  };
  return (
    <Section id="swap">
      <div className="container py-6">
        <Heading tag="cross-chain trading" title="Swap now" />

        <div className="relative">
          <div className="relative z-1 flex items-center h-[39rem] mb-5 p-8 border border-n-1/10 rounded-3xl  lg:p-20 xl:h-[46rem]">
            <div className="absolute top-0 left-0 w-full h-full pointer-events-none md:w-3/5 xl:w-auto"></div>
            <div
              style={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                height: "100vh",
                margin: "0px auto",
              }}
            >
              <div
                style={{
                  width: "480px",
                }}
              >
                <XSwapWidget config={config} theme={theme} />
              </div>
            </div>
            <div className="relative z-1 max-w-[17rem] ml-auto hidden lg:block">
              <h4 className="h4 mb-4">Trade without limits.</h4>
              <p className="body-2 mb-[3rem] text-n-3">
                The remainder will be handled automatically during the
                cross-chain trading proceedings by XY Finance.
              </p>
              <ul className="body-2">
                {swapServices.map((item, index) => (
                  <li
                    key={index}
                    className="flex items-start py-4 border-t border-n-6"
                  >
                    <img width={24} height={24} src={check} />
                    <p className="ml-4">{item}</p>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          <Gradient />
        </div>
        <CompanyLogos
          logo={XYFinance}
          logo2={XYLogo}
          className="hidden relative z-10 mt-10 lg:block"
        />
      </div>
    </Section>
  );
};

export default SwapWidget;
