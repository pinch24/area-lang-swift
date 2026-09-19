//
//  ThreadInfo.swift
//  SwiftActor
//
//  Created by mk on 12/13/23.
//

import Foundation

func getThreadInfo() -> String {
	return "[\(getIsMainThread() ? "Main" : "Background"), ID: \(getThreadId()) / No: \(getThreadNumber())]"
}

func getIsMainThread() -> Bool {
	return Thread.current.isMainThread
}

func getThreadId() -> String {
	return pthread_mach_thread_np(pthread_self()).description
}

func getThreadNumber() -> String {
	var value = ""
	let string = Thread.current.description
	if let frontRange = string.range(of: "number = "),
	   let backRange = string.range(of: ", name = ") {
		value = String(string[frontRange.upperBound..<backRange.lowerBound])
	}
	return value
}
