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
 * flex布局容器的space为FlexOptions，主轴方向设置LengthMetrics类型
 * SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110
 * 注：简化测试，使用number类型进行UI对比
 */
@Entry
@ComponentV2
export struct ColumnRowResource0110 {
  @Local currentSpace: number = 50;


  build() {
    Column() {
      Text('flex布局容器的space为FlexOptions，主轴方向设置LengthMetrics类型')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .textAlign(TextAlign.Center)
        .width('90%')

      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Text('测试类型: FlexOptions(main)')
        .fontSize(14)
        .fontColor('#333')
        .margin({ bottom: 10 })
        .id('btn')

      Text(`当前space值: ${this.currentSpace}`)
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

      Text('1、设置flex布局\n2、添加两个text组件\n3、设置space为main: LengthMetrics.px(50)\n4、查看text子组件间距')
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
