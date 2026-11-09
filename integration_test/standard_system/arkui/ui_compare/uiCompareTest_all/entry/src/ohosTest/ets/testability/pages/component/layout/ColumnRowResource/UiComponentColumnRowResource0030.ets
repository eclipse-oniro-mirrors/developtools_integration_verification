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
 * row组件space设置Resource类型中支持设置$r(belonging.type.name)
 * SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030
 */
@Entry
@ComponentV2
export struct ColumnRowResource0030 {
  @Local currentSpace: number | string | Resource = 5;
  @Local currentType: string = 'float';
  @Local resourceTypes: string[] = ['float', 'string', 'integer'];


  build() {
    Column() {
      Text('row组件space设置Resource类型中支持设置$r(belonging.type.name)')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .textAlign(TextAlign.Center)
        .width('90%')

      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Text('测试类型: Resource(支持)')
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

      Row({ space: 10 }) {
        ForEach(this.resourceTypes, (type: string) => {
          Button(`切换到${type}`)
            .width('45%')
            .onClick(() => {
              this.currentType = type;
              // 模拟不同资源类型的值
              if (type === 'float') {
                this.currentSpace = 10.5;
              } else if (type === 'string') {
                this.currentSpace = '15';
              } else if (type === 'integer') {
                this.currentSpace = 20;
              }
            })
            .margin(5)
        })
      }
      .width('90%')
            .justifyContent(FlexAlign.Center)

      Text('说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text(`1、添加row组件\n2、嵌套两个text子组件\n3、设置row组件space设置Resource类型\n4、动态切换$r('belonging.type.name')值为：float、string、integer\n5、查看text子组件间距`)
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
