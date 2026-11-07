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

// 定义类型和枚举
type ComplexType = number | string | boolean | null | undefined | (() => void);
enum LogLevel {
  Info = 'INFO',
  Error = 'ERROR'
}

// 数据模型
@ObservedV2
class AppData {
  @Trace current: ComplexType = 'Initial';

  // 计算属性（根据联合类型动态返回描述）
  @Computed get typeDescription(): string {
    switch (typeof this.current) {
      case 'number':
        return `数字: ${this.current}`;
      case 'boolean':
        return `布尔: ${this.current ? "是" : "否"}`;
      case 'function':
        return '函数类型';
      default:
        return this.current === null ? 'null' : 'undefined';
    }
  }
}

// 主组件
@Entry
@ComponentV2
struct MainPage180 {
  appData: AppData = new AppData();

  // 刷新联合类型值
  updateValue(newVal: ComplexType) {
    this.appData.current = newVal;
  }

  build() {
    Column() {
      // 显示联合类型信息
      Text('联合类型示例').fontSize(24).margin(10)
      Text(this.appData.typeDescription).fontSize(18)
      Text(`实际类型: ${typeof this.appData.current}`).fontColor(Color.Blue)

      // 操作按钮组
      Button('设置为数字')
        .onClick(() => this.updateValue(100))
        .margin(5)
        .id('btn')
    }
  }
}
