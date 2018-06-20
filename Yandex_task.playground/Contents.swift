/*
 The task from an interview with the Yandex.
 
 eng:
 1. Given a binary tree, the values in it are numbers.
 You need to write a function that returns the sum of all the nodes in the tree,
 who do not have descendants.
 For example, for a tree
     5
    / \
   4   2
  / \   \
 1   6   3
        /
       7
 The result is 14 (1 + 6 + 7).
 
 ru:
 1. Дано бинарное дерево, значения в нем - числа.
 Нужно написать функцию, которая возвращает сумму всех узлов дерева,
 у которых нет потомков.
 Например, для дерева
     5
    / \
   4   2
  / \   \
 1   6   3
        /
       7
 Результатом будет число 14 (1 + 6 + 7).
 */

import Foundation

struct Point {
    var value: Int
    var points: [Point]
}

func sumBinTree(point: Point) -> Int {
    var amount = 0
    if !point.points.isEmpty {
        for onePoint in point.points {
            amount += sumBinTree(point: onePoint)
        }
    } else {
        amount += point.value
    }
    
    return amount
}

let point1 = Point(value: 1, points: [Point]())
let point6 = Point(value: 6, points: [Point]())
let point4 = Point(value: 4, points: [point1, point6])

let point7 = Point(value: 7, points: [Point]())
let point3 = Point(value: 3, points: [point7])
let point2 = Point(value: 2, points: [point3])

let point5 = Point(value: 5, points: [point4, point2])

let result = sumBinTree(point: point5)
print(result)

