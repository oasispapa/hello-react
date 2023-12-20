import "./App.css";
import MyComponent from "./MyComponent";
import Counter from "./Counter";
import Say from "./Say";
import EventPractice from "./EventPractice";
import EventPracticeFunc from "./EventPracticeFunc";
import EventPracticeFunc2 from "./EventPracticeFunc2";
import ValidationSample from "./ValidationSample";

function App() {
  const name = "Jedd";
  const name2 = "신뢰";
  const style = {
    backgroundColor: "black",
    color: "aqua",
    fontSize: "48px", // font-size -> fontSize
    fontWeight: "bold", // font-weight -> fontWeight
    padding: 16, // 단위를 생략하면 px로 지정됩니다.
  };
  return (
    <>
      {name === "Jedd" && (
        <>
          <h1 style={style}>Hello {name} this is React</h1>
          <div className="react">I am 실망이에요</div>
          <MyComponent name={name2} sty="react" favoriteNumber={8}>
            리액트존잼
          </MyComponent>
          <Counter></Counter>
          <Say></Say>
          <EventPractice></EventPractice>
          <EventPracticeFunc></EventPracticeFunc>
          <EventPracticeFunc2></EventPracticeFunc2>
          <ValidationSample></ValidationSample>
        </>
      )}
    </>
  );
}

export default App;
