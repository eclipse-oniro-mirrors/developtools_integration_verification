/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
@Entry
@ComponentV2
struct IndexRe250 {
  @Local condition: boolean = true;
  build() {
    Column() {
      ReusableV2Component250()
      ReusableV2Component250()
      ReusableV2Component250()
        .reuse({reuseId: () => ''})
        Text('')
    }
  }
}
@ReusableV2
@ComponentV2
struct ReusableV2Component250 {
  @Local message: string = 'Hello World';
  aboutToRecycle() {
    console.log('ReusableV2Component aboutToRecycle'); // 回收时被调用

  }
  aboutToReuse() {
    console.log('ReusableV2Component aboutToReuse'); // 复用时被调用
    console.log(this.getUniqueId().toString())
  }
  build() {
    Column() {
      Text(this.message)
    }
  }
}
