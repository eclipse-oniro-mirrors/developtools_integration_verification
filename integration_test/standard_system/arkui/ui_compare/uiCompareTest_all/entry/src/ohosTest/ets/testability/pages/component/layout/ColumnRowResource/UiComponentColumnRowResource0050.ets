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

/**
 * row组件space设置Resource类型$rawfile(filename)
 * SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050
 */
@Entry
@ComponentV2
export struct ColumnRowResource0050 {
  @Local currentSpace: number | string = 0;


  build() {
    Column() {
      Text('row组件space设置Resource类型$rawfile(filename)')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .textAlign(TextAlign.Center)
        .width('90%')

      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Text('测试类型: rawfile')
        .fontSize(14)
        .fontColor('#333')
        .margin({ bottom: 10 })
        .id('btn')

      Text(`当前space值: ${typeof this.currentSpace === 'object' ? JSON.stringify(this.currentSpace) : this.currentSpace}`)
        .fontSize(14)
        .fontColor('#333')
        .margin({ bottom: 20 })

      Row({ space: this.currentSpace }) {
          Text('Text 1')
            .fontSize(16)
            .padding(10)
            .backgroundColor('#FFE5E5')

          Text('Text 2')
            .fontSize(16)
            .padding(10)
            .backgroundColor('#E5F3FF')
        }
        .width('90%')
        .height('8.2%')
        .border({ width: 2, color: '#FF6B35' })
        .margin({ top: 20, bottom: 20 })

      

      Text('说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text(`1、添加row组件\n2、嵌套两个text子组件\n3、设置row组件space设置Resource类型为$rawfile('filename')\n4、查看text子组件间距`)
        .fontSize(12)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
