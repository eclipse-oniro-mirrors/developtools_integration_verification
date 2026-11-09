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

@ObservedV2
class SearchModel {
  @Trace keyword: string = '';
  @Trace searchCount: number = 0;

  // @Computed修饰的计算属性
  @Computed
  get searchInfo(): string {
    return `搜索关键词: ${this.keyword}, 搜索次数: ${this.searchCount}`;
  }

  // 普通getter，用于双向绑定
  get bindableKeyword(): string {
    return this.keyword;
  }

  set bindableKeyword(value: string) {
    this.keyword = value;
  }
}

@Entry
@ComponentV2
struct ToolchainComputeVerify0020 {
  searchModel: SearchModel = new SearchModel();

  build() {
    Column() {
      Text('@Computed和双向绑定!!一起使用测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainComputeVerify0020_001')

      Text('测试说明: @Computed不能与双向绑定!!一起使用')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainComputeVerify0020_002')

      Divider().margin({ bottom: 20 })

      Text('搜索信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_003')

      Text(`关键词: ${this.searchModel.keyword}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_004')

      Text(`搜索次数: ${this.searchModel.searchCount}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_005')

      Text(`${this.searchModel.searchInfo}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0020_006')

      Divider().margin({ bottom: 20 })

      // ========== 错误用法示例（已注释） ==========
      // 如果取消注释以下代码，会产生编译错误：
      // 错误信息: "A property decorated by '@Computed' cannot be used with two-way bind syntax."
      // IDE会标红报错
      
      /*
      TextInput({ text: $$this.searchModel.searchInfo })  // ❌ 错误：@Computed属性不能使用双向绑定!!
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_007')
      */

      // ========== 修复方式：使用普通属性进行双向绑定 ==========
      // ✅ 正确：使用没有@Computed装饰的普通属性
      TextInput({ text: $$this.searchModel.bindableKeyword, placeholder: '输入搜索关键词' })
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_007')
        .onChange((value: string) => {
          console.info('[ComputeVerify] Keyword changed to: ' + value)
        })

      Text('(使用普通属性bindableKeyword进行双向绑定)')
        .fontSize(11)
        .fontColor('#999999')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0020_008')

      Button('增加搜索次数')
        .width('80%')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0020_009')
        .onClick(() => {
          this.searchModel.searchCount++;
          console.info('[ComputeVerify] Search count increased to: ' + this.searchModel.searchCount)
        })

      Divider().margin({ bottom: 20 })

      Text('预期结果验证:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_010')

      Text('预期结果1: 编译期报错')
        .fontSize(12)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_011')

      Text('要触发编译错误，请在代码第76-81行取消注释以下错误代码：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_012')

      Text('TextInput({ text: $$this.searchModel.searchInfo })')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_013')

      Text('错误信息: A property decorated by \'@Computed\' cannot be used with two-way bind syntax.')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_014')

      Text('预期结果2: IDE标红报错')
        .fontSize(12)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_015')

      Text('取消注释错误代码后，IDE会立即标红显示错误')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_016')

      Text('修复方式: 去掉@Computed')
        .fontSize(12)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_017')

      Text('将@Computed get searchInfo()改为普通的get searchInfo()，或使用其他可绑定属性')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_018')

      Text('当前实现（正确方式）:')
        .fontSize(12)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_019')

      Text('使用bindableKeyword属性（没有@Computed装饰）进行双向绑定，这样可以正常编译运行')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0020_020')

      Divider().margin({ top: 20, bottom: 20 })

      Text('验证步骤:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0020_021')

      Text('1. 打开ToolchainComputeVerify0020.ets文件')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainComputeVerify0020_022')

      Text('2. 找到第76-81行的注释代码')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainComputeVerify0020_023')

      Text('3. 取消注释，观察IDE标红和编译错误')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainComputeVerify0020_024')

      Text('4. 删除@Computed装饰器，验证错误消失')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainComputeVerify0020_025')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
