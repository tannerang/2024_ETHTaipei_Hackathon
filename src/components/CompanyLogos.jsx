import { dysonLogos } from "../constants";
import { dysonLogo } from "../assets";

const CompanyLogos = ({ className }) => {
  return (
    <div className={className}>
      <h5 className="tagline mb-6 text-center text-n-1/50">Powered by</h5>
      <ul className="flex justify-center items-center">
        <img
          className="justify-center items-center"
          src={dysonLogo}
          width={260}
          height={88}
          alt="dysonLogo"
        />
      </ul>
    </div>
  );
};

export default CompanyLogos;
