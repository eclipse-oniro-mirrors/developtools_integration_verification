/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: identifier_part_unicode_6_1_0
// description: Unicode 6.1.0 ID_Continue characters are valid identifier parts

function main(): void {
    let _ࣰࣱࣲࣦࣩ࣭࣮࣯ࣶࣹࣺࣤࣥࣧࣨ࣪࣫࣬ࣳࣴࣵࣷࣸࣻࣼࣽࣾ឴឵᮫ᮬᮭᳳ᳴ꙴꙵꙶꙷꙸꙹꙺꙻꚟꫫꫬꫭꫮꫯꫵ꫶𑃰𑃱𑃲𑃳𑃴𑃵𑃶𑃷𑃸𑃹𑄀𑄁𑄂𑄧𑄨𑄩𑄪𑄫𑄬𑄭𑄮𑄯𑄰𑄱𑄲𑄳𑄴𑄶𑄷𑄸: int = 1;
    let _𑄹𑄺𑄻𑄼𑄽𑄾𑄿𑆀𑆁𑆂𑆳𑆴𑆵𑆶𑆷𑆸: int = 1;
    let _𑆹𑆺𑆻𑆼𑆽𑆾𑆿𑇀𑇐𑇑𑇒𑇓𑇔𑇕𑇖𑇗𑇘𑇙𑚫𑚬𑚭𑚮𑚯𑚰𑚱𑚲𑚳𑚴𑚵𑚷𑚶𑛀𑛁𑛂𑛃𑛄𑛅𑛆𑛇𑛈𑛉𖽑𖽒𖽓𖽔𖽕𖽖𖽗𖽘𖽙𖽚𖽛𖽜𖽝𖽞𖽟𖽠𖽡𖽢𖽣𖽤𖽥𖽦𖽧𖽨𖽩𖽪𖽫𖽬𖽭𖽮𖽯𖽰𖽱𖽲𖽳𖽴𖽵𖽶𖽷: int = 1;
    let _𖽸𖽹𖽺𖽻𖽼𖽽𖽾𖾏𖾐𖾑𖾒: int = 1;
        arktest.assertEQ(_ࣰࣱࣲࣦࣩ࣭࣮࣯ࣶࣹࣺࣤࣥࣧࣨ࣪࣫࣬ࣳࣴࣵࣷࣸࣻࣼࣽࣾ឴឵᮫ᮬᮭᳳ᳴ꙴꙵꙶꙷꙸꙹꙺꙻꚟꫫꫬꫭꫮꫯꫵ꫶𑃰𑃱𑃲𑃳𑃴𑃵𑃶𑃷𑃸𑃹𑄀𑄁𑄂𑄧𑄨𑄩𑄪𑄫𑄬𑄭𑄮𑄯𑄰𑄱𑄲𑄳𑄴𑄶𑄷𑄸, 1,
        'Unicode 6.1.0 identifier part');
}