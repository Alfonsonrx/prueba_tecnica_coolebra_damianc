import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";

import { get_processed_data } from "./utils";

const App = () => {
  const [prodData, setProdData] = useState([]);
  const [filterInput, setFilterInput] = useState([]);
  const [filteredData, setFilteredData] = useState([]);

  const fetchData = async () => {
    const data = await get_processed_data();
    setProdData([...Object.values(data)]);
    setFilteredData([...Object.values(data)]);
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleInputFilter = (e) => {
    setFilterInput(e.target.value)
    const dataFiltered = prodData.filter(prod => 
      prod.prod_name.toLowerCase().includes(e.target.value.toLowerCase()));
      setFilteredData(dataFiltered);
  }

  return (
    <div className="container">
      <div className="input-group m-3">
        <input type="text" className="form-control" placeholder="Nombre producto" value={filterInput} onChange={(e) => {handleInputFilter(e)}}/>
      </div>
      <table class="table mx-4">
        <thead>
          <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Rango de precios</th>
            <th scope="col">Mercados</th>
          </tr>
        </thead>
        <tbody>
          {filteredData?.map((product, index) => (
            <tr key={index}>
              <td>{product.prod_name}</td>
              <td>{product.price_range.precio_mayor} - {product.price_range.precio_menor}</td>
              <td>{product.market_quantity}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default App;