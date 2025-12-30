create database btth;
use btth;

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);


CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);


CREATE TABLE Enrollment (
    student_id VARCHAR(10),
    course_id VARCHAR(10),
    grade DECIMAL(4,2) DEFAULT 0,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);



INSERT INTO Student (student_id, full_name, email, phone) VALUES
('SV001', 'Nguyễn Văn A', 'an.nguyen@gmail.com', '0901234567'),
('SV002', 'Trần Thị B', 'binh.tran@gmail.com', '0902345678'),
('SV003', 'Lê Văn C', 'cuong.le@gmail.com', '0903456789'),
('SV004', 'Phạm Thị D', 'dung.pham@gmail.com', '0904567890'),
('SV005', 'Hoàng Văn A', 'anh.hoang@gmail.com', '0905678901');

INSERT INTO Course (course_id, course_name, credits) VALUES
('MH001', 'Cơ sở dữ liệu', 3),
('MH002', 'Lập trình C', 4),
('MH003', 'Lập trình Web', 3),
('MH004', 'Mạng máy tính', 3),
('MH005', 'Hệ điều hành', 4);

INSERT INTO Enrollment (student_id, course_id, grade) VALUES
('SV001', 'MH001', 8.5),
('SV002', 'MH003', 7),
('SV003', 'MH002', 6),
('SV004', 'MH004', 9.0),
('SV005', 'MH005', 8.0);

UPDATE Enrollment
SET grade = 9.0 WHERE student_id = 'SV002' AND course_id = 'MH003';



SELECT student_id, course_id, grade FROM Enrollment;
SELECT full_name, email, phone FROM Student;

DELETE FROM Course where course_id = 'MH001';
-- Không xóa được vì ràng buộc khóa ngoại để bảo toàn toàn vẹn dữ liệu 