import Button from "./Button";
import Section from "./Section";
import Heading from "./Heading";
import { roadmap } from "../constants";
import {
  check2,
  grid,
  loading1,
  loading2,
  body,
  roadmap1,
  curve,
  lighting,
  arrorLogo,
} from "../assets";
import { Gradient } from "./design/Roadmap";
import Tagline from "./Tagline";
import Form from "./design/Form";

const Application = () => {
  return (
    <Section id="launchpad" className="overflow-hidden">
      <div className="container md:pb-10 py-8">
        <Heading tag="Ready to go" title="Let's create your first ERC-404" />
        <div className="relative grid gap-6 md:grid-cols-2 md:gap-4 md:pb-[7rem]">
          <div className="md:flex even:md:translate-y-[7rem] p-0.25 rounded-[2.5rem] bg-conic-gradient">
            <div className="relative p-8 bg-n-8 rounded-[2.4375rem] overflow-hidden xl:p-15">
              <div className="absolute top-0 left-0 max-w-full">
                <img
                  className="w-full"
                  src={grid}
                  width={550}
                  height={550}
                  alt="Grid"
                />
              </div>
              <div className="relative z-1">
                <div className="flex items-center justify-between max-w-[27rem] mb-8 md:mb-20">
                  <Tagline>Launchpad Form</Tagline>

                  <div className="flex items-center px-4 py-1  rounded text-n-8">
                    <img
                      className="mr-2.5"
                      src={loading1}
                      width={16}
                      height={16}
                      alt="loading"
                    />
                    <div className="tagline">loading</div>
                  </div>
                </div>
                <div className="mb-10 -my-10 -mx-15">
                  <Form />
                  <img
                    className="w-full py-16"
                    src={curve}
                    width={628}
                    height={426}
                    alt="application"
                  />
                </div>
                <h4 className="h4 mb-4">Ready, set, go!</h4>
                <p className="body-2 text-n-4">
                  Allow users to customize the ERC-404's NFT image, making it
                  easier and faster to interact with.
                </p>
              </div>
            </div>
          </div>

          <div className="md:flex even:md:translate-y-[7rem] p-0.25 rounded-[2.5rem] bg-n-6">
            <div className="relative p-8 bg-n-8 rounded-[2.4375rem] overflow-hidden xl:p-15">
              <div className="absolute top-0 left-0 max-w-full">
                <img
                  className="w-full"
                  src={grid}
                  width={550}
                  height={550}
                  alt="Grid"
                />
              </div>
              <div className="relative z-1">
                <div className="flex items-center justify-between max-w-[27rem] mb-8 md:mb-20">
                  <Tagline>New Listing</Tagline>

                  <div className="flex items-center px-4 py-1 bg-n-1 rounded text-n-8">
                    <img
                      className="mr-2.5"
                      src={loading2}
                      width={16}
                      height={16}
                      alt="loading"
                    />
                    <div className="tagline">loading</div>
                  </div>
                </div>
                <div className="mb-10 -my-10 -mx-15">
                  <img
                    className="w-full"
                    src={body}
                    width={628}
                    height={426}
                    alt="application"
                  />
                </div>
                <h4 className="h4 mb-4">Ready to go</h4>
                <p className="body-2 text-n-4">
                  Allow users to customize the ERC-404's NFT image, making it
                  easier and faster to interact with.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Section>
  );
};

export default Application;
