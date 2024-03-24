import Button from "../Button";
import { useEffect, useState } from "react";
import {
  useWriteContract,
  useReadContract,
  useWaitForTransactionReceipt,
} from "wagmi";
import { CONFIG } from "../../../config";
import ArrorFactory from "../../abis/ArrorFactory.json";
import Factory from "../../abis/Factory.json";

const Form = () => {
  const [formData, setFormData] = useState({
    Name: "",
    Symbol: "",
    TotalSupply: "",
    Token_URI_1: "",
    Token_URI_2: "",
    Token_URI_3: "",
    Token_URI_4: "",
    Token_URI_5: "",
  });
  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    // e.preventDefault();
    // const newErrors = {};

    // if (formData.Name.trim() === "") {
    //   newErrors.Name = "Name is required";
    // }
    // if (formData.Symbol.trim() === "") {
    //   newErrors.Symbol = "Symbol is required";
    // }
    // if (formData.TotalSupply.trim() === "") {
    //   newErrors.TotalSupply = "Max Total Supply is required";
    // }
    // if (formData.Token_URI_1.trim() === "") {
    //   newErrors.Token_URI_1 = "Token URI 1 is required";
    // }
    // if (formData.Token_URI_2.trim() === "") {
    //   newErrors.Token_URI_2 = "Token URI 2 is required";
    // }
    // if (formData.Token_URI_3.trim() === "") {
    //   newErrors.Token_URI_3 = "Token URI 3 is required";
    // }
    // if (formData.Token_URI_4.trim() === "") {
    //   newErrors.Token_URI_4 = "Token URI 4 is required";
    // }
    // if (formData.Token_URI_5.trim() === "") {
    //   newErrors.Token_URI_5 = "Token URI 5 is required";
    }

    // if (Object.keys(newErrors).length > 0) {
    //   // setErrors(newErrors);
    // } else {
    //   // 表单验证通过，执行提交逻辑
    //   console.log("Form submitted:", formData);
    //   // 清空表单数据
    //   setFormData({
    //     Name: "",
    //     Symbol: "",
    //     TotalSupply: "",
    //     Token_URI_1: "",
    //     Token_URI_2: "",
    //     Token_URI_3: "",
    //     Token_URI_4: "",
    //     Token_URI_5: "",
    //   });
    //   // 清空错误信息
    //   setErrors({});
    // }
  // };

  const result = useReadContract({
    abi: Factory,
    address: CONFIG.FACTORY_ADDRESS,
    functionName: "allPairsLength",
  });

  const { data: create404Hash, writeContract, isLoading } = useWriteContract();
  async function submit4() {
    // const formData = new FormData(e.target)
    // const tokenId = formData.get('tokenId')
    writeContract({
      address: CONFIG.ARROR_FACTORY_ADDRESS,
      abi: ArrorFactory,
      functionName: "createERC404",
      args: [
        "123",
        "123",
        18,
        1000,
        "https://ipfs.io/ipfs/QmesrK8rNHy6HEyscLtDeBGPFsxo7ZpZ9caP7JgCGvJGWP/1.jpeg",
        "https://ipfs.io/ipfs/QmesrK8rNHy6HEyscLtDeBGPFsxo7ZpZ9caP7JgCGvJGWP/1.jpeg",
        "https://ipfs.io/ipfs/QmesrK8rNHy6HEyscLtDeBGPFsxo7ZpZ9caP7JgCGvJGWP/1.jpeg",
        "https://ipfs.io/ipfs/QmesrK8rNHy6HEyscLtDeBGPFsxo7ZpZ9caP7JgCGvJGWP/1.jpeg",
        "https://ipfs.io/ipfs/QmesrK8rNHy6HEyscLtDeBGPFsxo7ZpZ9caP7JgCGvJGWP/1.jpeg",
        CONFIG.ARROR_FACTORY_ADDRESS,
      ],
    });
  }

    // const {
    //   isLoading: isConfirming,
    //   isSuccess: isConfirmed,
    //   data: receipt,
    // } = useWaitForTransactionReceipt({
    //   hash: create404Hash,
    // });

    // writeContract({
    //     address: CONFIG.ARROR_FACTORY_ADDRESS,
    //     abi: ArrorFactory,
    //     functionName: 'testBool2',
    //     args: [123],
    // })

  const {
    data: hash2,
    writeContract: writeContract2,
    isPending,
  } = useWriteContract();

  async function submit2(e) {
    e.preventDefault();
    // const formData = new FormData(e.target as HTMLFormElement)
    // const tokenId = formData.get('tokenId') as string
    writeContract2({
      address: CONFIG.ARROR_FACTORY_ADDRESS,
      abi: ArrorFactory,
      functionName: "testBool",
    });
  }

  // const {
  //   isLoading: isConfirming,
  //   isSuccess: isConfirmed,
  //   data: receipt,
  // } = useWaitForTransactionReceipt({
  //   hash: hash2,
  // });


  return (
    <form onSubmit={handleSubmit} class="max-w-md mx-auto">
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Name"
          value={formData.Name}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-n-1 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        {/* {errors.Name && <span>{errors.Name}</span>} */}
        <label
          for="Name"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token Name
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Symbol"
          value={formData.Symbol}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        {errors.Symbol && <span>{errors.Synbol}</span>}
        <label
          for="Symbol"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token Symbol
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="TotalSupply"
          value={formData.TotalSupply}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="TotalSupply"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Max Total Supply
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Token_URI_1"
          value={formData.Token_URI_1}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="Token_URI_1"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token URI 1
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Token_URI_2"
          value={formData.Token_URI_2}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="Token_URI_2"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token URI 2
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Token_URI_3"
          value={formData.Token_URI_3}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="Token_URI_3"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token URI 3
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Token_URI_4"
          value={formData.Token_URI_4}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="Token_URI_4"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token URI 4
        </label>
      </div>
      <div class="relative z-0 w-full mb-5 group">
        <input
          type="text"
          name="Token_URI_5"
          value={formData.Token_URI_5}
          onChange={handleChange}
          class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer"
          placeholder=" "
          // required
        />
        <label
          for="Token_URI_5"
          class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
        >
          Token URI 5
        </label>
      </div>

      <Button type="submit" disabled={!submit2 || isPending} onClick={submit2}>
        {isPending ? "Confirming..." : "CreateTest"}
      </Button>

      <Button 
      type="submit" 
      disabled={!submit4} 
      onClick={submit4}
      >
        {isLoading ? "Confirming..." : "Create"}
      </Button>
      {/* {create404Hash && <div>Transaction Hash: {create404Hash}</div>} */}
      {/* {isConfirming && <div>Waiting for confirmation...</div>}
      {isConfirmed && <div>Transaction confirmed.</div>} */}
    </form>
  );
};

export default Form;
