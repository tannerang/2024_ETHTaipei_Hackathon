//import { dysonLogos } from "../constants";
import "../assets";

const CompanyLogos = ({ className, logo, logo2 }) => {
  return (
    <div className={className}>
      <h5 className="tagline mb-6 text-center text-n-1/50">Powered by</h5>
      <ul className="flex">
        {logo2 && (
          <li
            className="flex items-center justify-end flex-1 h-[2.5rem] ml-[-13rem] mr-3"
            key={`"${logo2}"`}
          >
            <img
              className="flex justify-content"
              src={logo2}
              width={50}
              height={50}
              alt={`"${logo2}"`}
            />
          </li>
        )}
        <li
          className={`flex items-center ${
            logo2 ? "justify-start" : "justify-center"
          } flex-1 h-[2.5rem]`}
          key={`"${logo}"`}
        >
          <img
            className="justify-center items-center"
            src={logo}
            width={260}
            height={88}
            alt={`"${logo}"`}
          />
        </li>
      </ul>
    </div>
  );
};

export default CompanyLogos;
