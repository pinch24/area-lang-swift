//
//  ThreadInfo.swift
//  SwiftActor
//
//  Created by mk on 12/13/23.
//

import Foundation

func getThreadInfo() -> String {
	return "[\(getIsMainThread() ? "Main" : "Worker"), ID: \(getThreadId()) / No: \(getThreadNumber())]"
}

func getIsMainThread() -> Bool {
	return Thread.current.isMainThread
}

func getThreadId() -> String {
	let threadId = pthread_mach_thread_np(pthread_self())
	return String(format: "%8d", threadId)
}

func getThreadNumber() -> String {
	var value = ""
	let string = Thread.current.description
	if let frontRange = string.range(of: "number = "),
	   let backRange = string.range(of: ", name = ") {
		value = String(string[frontRange.upperBound..<backRange.lowerBound])
	}
	
	let threadNo = Int(value) ?? 0
	return String(format: "%4d", threadNo)
}
