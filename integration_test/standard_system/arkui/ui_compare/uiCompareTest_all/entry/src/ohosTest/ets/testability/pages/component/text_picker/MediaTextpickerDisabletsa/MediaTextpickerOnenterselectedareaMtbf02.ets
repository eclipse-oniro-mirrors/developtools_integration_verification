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
@Component
struct MediaTextpickerOnenterselectedareaMtbf02 {
  private options: string[] = ['苹果', '香蕉', '橙子', '葡萄'];
  @State selectedItem: string = '苹果';

  build() {
    Column() {
      Button('打开选择器')
        .onClick(() => {
          // 核心调用
          TextPickerDialog.show({
            range: this.options,                // 选项数组
            selected: this.options.indexOf(this.selectedItem), // 默认选中项索引
          })
        })
        .id('MediaTextpickerDisabletsa01')
    }
    .padding(20)
  }
}