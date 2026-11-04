/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fs from '@ohos.file.fs';

let listTxt: Array<string> = [];

export default class performance {
  private static list: Array<string> = [];

  static apiWithClassAndKeywordTxt(filename: string, classname: string, method: string, keyword: string, value: number): void {
    let content: string = filename + "#" + classname + "#" + method + "#" + keyword + "#" + value;
    listTxt.push(content);
  }

  static apiWithClassAndKeyword(filename: string, classname: string, method: string, keyword: string, value: number): void {
    let content = filename + "\t" + classname + "\t" + method + "\t" + keyword + "\t" + value;
    performance.list.push(content);
  }

  static apiWithClass(filename: string, classname: string, method: string, value: number): void {
    let content = filename + "\t" + classname + "\t" + method + "\t" + "*" + "\t" + value;
    performance.list.push(content);
  }

  static apiWithKeyword(filename: string, method: string, keyword: string, value: number): void {
    let content = filename + "\t" + "" + "\t" + method + "\t" + keyword + "\t" + value;
    performance.list.push(content);
  }

  static api(filename: string, method: string, value: number): void {
    let content = filename + "\t" + "" + "\t" + method + "\t" + "*" + "\t" + value;
    performance.list.push(content);
  }

  static save(filename: string): void {
    let filepath = '/data/storage/el2/base/haps/' + filename;
    console.info("filepath: " + filepath);
    let file = fs.openSync(filepath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, listTxt.join("\n"));
    fs.closeSync(file);
    console.info("The length of str is: " + writeLen);
  }

  static logger(filename: string, content: string): void {
    let filepath = '/data/storage/el2/base/haps/' + filename;
    console.info("filepath: " + filepath);
    let file = fs.openSync(filepath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file.fd, content);
    fs.closeSync(file);
    console.info("The length of str is: " + writeLen);
  }
}