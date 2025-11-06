// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint rollNo;
        string name;
        uint age;
        string course;
    }

    Student[] public students;

    function addStudent(uint _rollNo, string memory _name, uint _age, string memory _course) public {
        Student memory newStudent = Student(_rollNo, _name, _age, _course);
        students.push(newStudent);
    }

    function getStudent(uint index) public view returns (uint, string memory, uint, string memory) {
        require(index < students.length, "Invalid index");
        Student memory s = students[index];
        return (s.rollNo, s.name, s.age, s.course);
    }

    function getStudentCount() public view returns (uint) {
        return students.length;
    }

    fallback() external payable {
        emit ReceivedEther(msg.sender, msg.value);
    }

    receive() external payable {
        emit ReceivedEther(msg.sender, msg.value);
    }

    event ReceivedEther(address sender, uint amount);
}