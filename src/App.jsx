import ButtonGradient from "./assets/svg/ButtonGradient";
import Header from "./components/Header";
import Hero from "./components/Hero";

const App = () => {
  return (
    <>
      <div className="pt-[4.75rem] lg:pt-[5.25rem] overflow-hidden ">
        <Header />
        <Hero />
        <div className="pt-[4.75rem] lg:pt-[5.25rem] flex items-center justify-center ">
          <iframe width={480} height={700} src="https://widget.xy.finance" />
        </div>
      </div>
      <ButtonGradient />
    </>
  );
};

export default App;
