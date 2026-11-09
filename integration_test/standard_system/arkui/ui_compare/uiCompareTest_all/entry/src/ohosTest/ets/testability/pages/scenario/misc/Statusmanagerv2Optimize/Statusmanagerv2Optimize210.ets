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

// 数据模型
@ObservedV2
class AppData210 {
  @Trace current: string = 'hello';

  // 计算属性（根据联合类型动态返回描述）
  @Computed get typeDescription(): string {
    return this.current;
  }
}

// 主组件
@Entry
@ComponentV2
struct MainPage210 {
  appData: AppData210 = new AppData210();

  build() {
    Column() {
      // 显示联合类型信息
      Text('文本：'+this.appData.typeDescription).fontSize(18)

      // 操作按钮组
      Button('refresh')
        .onClick(()=>{this.appData.current = 'hi'})
        .margin(5)
        .id('btn')
    }
  }
}
