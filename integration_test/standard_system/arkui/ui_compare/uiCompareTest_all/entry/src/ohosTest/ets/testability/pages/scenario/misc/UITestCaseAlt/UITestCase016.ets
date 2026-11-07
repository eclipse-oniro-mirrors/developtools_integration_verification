/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { matrix4 } from '@kit.ArkUI'
const TAG = 'UITestCase016'

@Entry
@Component
struct UITestCase016 {
  @State matrix: string | matrix4.Matrix4Transit = 'test16 start'
  @State matrix1: matrix4.Matrix4Transit = matrix4.identity()
  build() {
    Row() {
      Column() {
        Button(JSON.stringify(this.matrix))
          .fontSize(20)
          .fontColor(Color.Blue)
          .margin({ top: 100 })
          .id('SrcArray_004')
          .onClick(()=>{
            this.matrix = matrix4.identity().setPolyToPoly({
              src: [{x: 100, y: 100}, {x: 150, y: 150}, {x: 150, y: 100}, {x: 100, y: 50}],
              dst: [{x: 200, y: 200}, {x: 250, y: 200}, {x: 250, y: 150}, {x: 200, y: 150}], pointCount: 4
            })
            this.matrix1 =matrix4.identity().setPolyToPoly({
              src: [{x: 210, y:190}, {x: 240, y: 190}, {x: 240, y: 160}, {x: 210, y: 160}],
              dst: [{x: 190, y: 230}, {x: 300, y: 230}, {x: 300, y: 100}, {x: 190, y: 100}], pointCount: 4
            })
            console.info('matrix: ' + JSON.stringify(this.matrix))
          })
          .backgroundColor(Color.White)
          .border({width:1,color:Color.Black})
          .height('10%').width('100%')

        Column() {
          Image($r('app.media.icon'))
            .backgroundColor(Color.Yellow)
            .scale({ centerX: 0, centerY: 0, x: 1 })
            .transform(this.matrix1)
            .margin({ top: 20 })
            .width('500px')
            .height('500px')
            .border({ width: 1, color: Color.Black })
        }
        .margin({ top: 30 })
        .width('600px')
        .height('600px')
        .border({ width: 1, color: Color.Black })
      }
      .width('100%')
      .height('100%')
    }
  }
}