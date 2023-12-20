import React, { useRef, useEffect } from "react";

const ScrollableTableWithFixedHeader = () => {
  const tableRef = useRef();

  useEffect(() => {
    const table = tableRef.current;
    const header = table.querySelector("thead");

    const handleScroll = () => {
      const rect = table.getBoundingClientRect();
      if (rect.top <= 0 && rect.bottom >= header.clientHeight) {
        header.style.position = "fixed";
        header.style.top = "0";
      } else {
        header.style.position = "static";
        header.style.top = "auto";
      }
    };

    table.addEventListener("scroll", handleScroll);

    return () => {
      table.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return (
    <div ref={tableRef}>
      <table>
        <thead>
          <tr>
            <th>Header 1</th>
            <th>Header 2</th>
            {/* Add more header cells as needed */}
          </tr>
        </thead>
        <tbody style={{ overflowY: "auto", height: "400px" }}>
          {/* Add your table body rows here */}
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            {/* Add more cells as needed */}
          </tr>
          {/* Add more rows as needed */}
        </tbody>
      </table>
    </div>
  );
};

export default ScrollableTableWithFixedHeader;
