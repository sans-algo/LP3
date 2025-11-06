// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
        string course;
    }

    Student[] public students;

    function addStudent(uint256 _id, string calldata _name, uint256 _age, string calldata _course) external {
        students.push(Student(_id, _name, _age, _course));
    }

    function getStudent(uint256 index) external view returns (uint256, string memory, uint256, string memory) {
        Student memory s = students[index];
        return (s.id, s.name, s.age, s.course);
    }

    function getTotalStudents() external view returns (uint256) {
        return students.length;
    }

    receive() external payable {}

    fallback() external payable {}
}