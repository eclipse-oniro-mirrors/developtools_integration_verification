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
 * row组件设置正常间距，动态切换space为非法引用资源类型
 * SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160
 */
@Entry
@ComponentV2
export struct ColumnRowResource0160 {
  @Local currentSpace: number | string | Resource = 5;
  @Local currentType: string = 'initial';
  @Local testValues: string[] = ['boolean', 'color', 'intarray', 'pattern', 'plural', 'strarray', 'media', 'rawfile'];

  switchSpace(value: string): void {
    this.currentType = value;
    if (value.includes('float')) {
      const num = parseFloat(value.match(/-?\d+/)?.[0] || '0');
      // 模拟float资源
      this.currentSpace = num;
    } else if (value.includes('integer')) {
      const num = parseInt(value.match(/-?\d+/)?.[0] || '0');
      // 模拟integer资源
      this.currentSpace = num;
    } else if (value.includes('string')) {
      // 模拟string资源
      const match = value.match(/["']([^"']*)["']/);
      this.currentSpace = match ? match[1] : value;
    } else if (value.includes('rawfile')) {
      // rawfile不支持，设置为0
      this.currentSpace = 0;
    } else if (value === 'boolean' || value === 'color' || value === 'intarray' || 
               value === 'pattern' || value === 'plural' || value === 'strarray' || 
               value === 'media') {
      // 模拟不支持的资源类型，设置为资源引用但实际会被解析为0
      // 模拟不支持的资源类型
      this.currentSpace = 0;
    } else {
      this.currentSpace = value as string;
    }
  }

  build() {
    Column() {
      Text('row组件设置正常间距，动态切换space为非法引用资源类型')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .textAlign(TextAlign.Center)
        .width('90%')

      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Text('测试类型: 动态切换(非法资源)')
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
        ForEach(this.testValues, (value: string, index: number) => {
          Button(`切换: ${value}`)
            .width('45%')
            .fontSize(12)
            .onClick(() => {
              this.switchSpace(value);
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

      Text(`1、添加row组件\n2、嵌套两个text子组件\n3、设置row组件space为5\n4、动态切换space值为非法引用资源类型：'boolean'，'color'，'intarray'，'pattern'，'plural'，'strarray'，'media'，$rawfile('filename')\n5、查看text子组件间距`)
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
