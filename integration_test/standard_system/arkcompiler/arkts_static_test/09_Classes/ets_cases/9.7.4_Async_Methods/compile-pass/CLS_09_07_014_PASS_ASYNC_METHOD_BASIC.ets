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
/**
 * @id CLS_09_07_014_PASS_ASYNC_METHOD_BASIC
 * @expect compile-pass
 * @section 9.7.4
 * @design 异步方法基本用法：async修饰符，返回Promise<T>，await表达式
 * @note 正向用例：合法的async方法声明，包含静态和实例async方法
 */
class DataFetcher014 {
  async fetchData(): Promise<string> {
    return "data"
  }

  async fetchWithDelay(): Promise<string> {
    let result: string = "delayed"
    return result
  }
}

class AsyncProcessor014 {
  // Static async method
  static async process(input: string): Promise<string> {
    let output: string = input + "_processed"
    return output
  }

  // Instance async method
  async transform(input: string): Promise<string> {
    let step1: string = input + "_step1"
    return step1
  }
}

async function testAsyncMethods(): Promise<void> {
  let fetcher: DataFetcher014 = new DataFetcher014()
  let d: string = await fetcher.fetchData()
  let delayed: string = await fetcher.fetchWithDelay()

  let processor: AsyncProcessor014 = new AsyncProcessor014()
  let p1: string = await AsyncProcessor014.process("input")
  let p2: string = await processor.transform("data")
}
