/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

 @State message: string = 'Hello World'
  controller: RichEditorController = new RichEditorController();
   build() {
         Row() {
           Column() {
             // 基础RichEditor组件
             RichEditor({
               controller: this.controller
             })
               .id("rich_editor_3812")
               .width('100%')
               .height(40)
               .backgroundColor(Color.White)
               .selectedBackgroundColor($r("app.color.editor_selected_bg"))
               .border({ width: 1, color: Color.Blue })
               .padding(10)

           }
           .width('100%')
           .height('32.79%')

           Column() {
             Text(this.message)
               .fontSize(50)
               .fontWeight(FontWeight.Bold)
             Button() {
               Text('next page')
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
             }
             .type(ButtonType.Capsule)
             .margin({
               top: 20
             })
             .backgroundColor('#0D9FFB')
             .width('35%')
             .height('5%')
             .onClick(()=>{
             })
           }
             .width('100%')
         }
             .height('100%')
   }
 }