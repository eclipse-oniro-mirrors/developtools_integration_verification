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
struct DataPanelWatches0015 {
  build() {
    Column() {
      Row() {
        Stack(){
          DataPanel({
            values: [50],
            max: 100,
            type: DataPanelType.Circle,
          }).width(200).height(200)
            .trackBackgroundColor(123)
            .padding(10)
        }
        Stack(){
          DataPanel({
            values: [50],
            max: 100,
            type: DataPanelType.Circle,
          }).width(200).height(200)
            .trackBackgroundColor(null)
            .padding(10)
        }
      }

      Row() {
        Stack(){
          DataPanel({
            values: [50],
            max: 100,
            type: DataPanelType.Circle,
          }).width(200).height(200)
            .trackBackgroundColor(undefined)
            .padding(10)
        }
        Stack(){
          DataPanel({
            values: [50],
            max: 100,
            type: DataPanelType.Circle,
          }).width(200).height(200)
            .trackBackgroundColor(-5678)
            .padding(10)
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }
}