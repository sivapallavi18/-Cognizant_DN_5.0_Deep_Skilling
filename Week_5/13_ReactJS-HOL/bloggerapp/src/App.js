import React from "react";
import "./App.css";

import { books } from "./books";
import { blogs } from "./blogs";
import { courses } from "./courses";

function App() {

  const courseDet = (
    <ul>
      {courses.map((course) => (
        <div key={course.id}>
          <h2>{course.cname}</h2>
          <h4>{course.date}</h4>
        </div>
      ))}
    </ul>
  );

  const bookDet = (
    <ul>
      {books.map((book) => (
        <div key={book.id}>
          <h3>{book.bname}</h3>
          <h4>{book.price}</h4>
        </div>
      ))}
    </ul>
  );

  const content = (
    <ul>
      {blogs.map((blog) => (
        <div key={blog.id}>
          <h2>{blog.title}</h2>
          <h4>{blog.author}</h4>
          <p>{blog.content}</p>
        </div>
      ))}
    </ul>
  );

  return (
    <div className="container">
      <div className="course">
        <h1>Course Details</h1>
        {courseDet}
      </div>

      <div className="book">
        <h1>Book Details</h1>
        {bookDet}
      </div>

      <div className="blog">
        <h1>Blog Details</h1>
        {content}
      </div>
    </div>
  );
}

export default App;