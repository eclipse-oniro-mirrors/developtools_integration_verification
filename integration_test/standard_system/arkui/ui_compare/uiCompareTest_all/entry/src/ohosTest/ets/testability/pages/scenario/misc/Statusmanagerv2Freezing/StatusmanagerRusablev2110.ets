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
struct Index110 {
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('回收/复用').onClick(()=>{this.condition=!this.condition;}) // 点击切换回收/复用状态
      if (this.condition) {
        ReusableV2Component110().reuse({reuseId: () => 'reuseComponent'})
      }
    }
  }
}
@ReusableV2
@ComponentV2
struct ReusableV2Component110 {
  @Local message: string = 'Hello World';
  aboutToRecycle() {
    console.log('ReusableV2Component aboutToRecycle'); // 回收时被调用
  }
  aboutToReuse() {
    console.log('ReusableV2Component aboutToReuse'); // 复用时被调用
  }
  build() {
    Column() {
      Text(this.message)
      ReusableV2Component111().reuse({reuseId: () => 'reuseComponent_1'})
    }
  }
}
@ReusableV2
@ComponentV2
struct ReusableV2Component111 {
  @Local message: string = 'Hello World';
  aboutToRecycle() {
    console.log('ReusableV2Component aboutToRecycle'); // 回收时被调用
  }
  aboutToReuse() {
    console.log('ReusableV2Component aboutToReuse'); // 复用时被调用
  }
  build() {
    Column() {
      Text(this.message)
    }
  }
}
