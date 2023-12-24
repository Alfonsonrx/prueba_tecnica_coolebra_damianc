import axios from 'axios';

const results = [
  ["Lenovo Omen X15", "ABC12345", "799439112766", "5", "1079990"],
  ["Sueter Talla M",	"XYZ12345",	"123459112766",	"6",	"4990"],
  ["Iphone 13",	"FSD54321",	"799635312766",	"7",	"72990"],
  ["Lenovo Omen X15",	"XYZ54321",	"799439112766",	"5",	"499000"],
  ["Sueter Talla M",	"MLS35231",	"123459112766",	"6",	"12990"],
  ["8GB Ram",	"GLZ64331",	"1249439112846",	"8",	"15990"],
]

export const get_processed_data = async () => {
  const config = {
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
  };
  try {
    const response = await axios.get(`http://localhost:8000/functions/get_data/`, config);

    return response.data;
  } catch (err) {
    console.log(err);
  }
}