/**
 * Copyright (c) 2026 Ivan Iraci <ivan.iraci@professioneit.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import { z } from 'zod';
export declare const GotoDefinitionSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export declare const GotoTypeDefinitionSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export declare const FindReferencesSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    include_declaration: z.ZodDefault<z.ZodBoolean>;
    limit: z.ZodDefault<z.ZodNumber>;
    offset: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    include_declaration: boolean;
    limit: number;
    offset: number;
}, {
    file_path: string;
    line: number;
    column: number;
    include_declaration?: boolean | undefined;
    limit?: number | undefined;
    offset?: number | undefined;
}>;
export declare const FindImplementationsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    limit: number;
}, {
    file_path: string;
    line: number;
    column: number;
    limit?: number | undefined;
}>;
export declare const HoverSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export declare const SignatureHelpSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export declare const DocumentSymbolsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
}, {
    file_path: string;
}>;
export declare const WorkspaceSymbolsSchema: z.ZodObject<{
    query: z.ZodString;
    kinds: z.ZodOptional<z.ZodArray<z.ZodEnum<["File", "Module", "Namespace", "Package", "Class", "Method", "Property", "Field", "Constructor", "Enum", "Interface", "Function", "Variable", "Constant", "String", "Number", "Boolean", "Array", "Object", "Key", "Null", "EnumMember", "Struct", "Event", "Operator", "TypeParameter"]>, "many">>;
    limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    limit: number;
    query: string;
    kinds?: ("File" | "Module" | "Namespace" | "Package" | "Class" | "Method" | "Property" | "Field" | "Constructor" | "Enum" | "Interface" | "Function" | "Variable" | "Constant" | "String" | "Number" | "Boolean" | "Array" | "Object" | "Key" | "Null" | "EnumMember" | "Struct" | "Event" | "Operator" | "TypeParameter")[] | undefined;
}, {
    query: string;
    limit?: number | undefined;
    kinds?: ("File" | "Module" | "Namespace" | "Package" | "Class" | "Method" | "Property" | "Field" | "Constructor" | "Enum" | "Interface" | "Function" | "Variable" | "Constant" | "String" | "Number" | "Boolean" | "Array" | "Object" | "Key" | "Null" | "EnumMember" | "Struct" | "Event" | "Operator" | "TypeParameter")[] | undefined;
}>;
export declare const DiagnosticsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    severity_filter: z.ZodDefault<z.ZodEnum<["all", "error", "warning", "info", "hint"]>>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    severity_filter: "info" | "error" | "warning" | "hint" | "all";
}, {
    file_path: string;
    severity_filter?: "info" | "error" | "warning" | "hint" | "all" | undefined;
}>;
export declare const WorkspaceDiagnosticsSchema: z.ZodObject<{
    severity_filter: z.ZodDefault<z.ZodEnum<["all", "error", "warning", "info", "hint"]>>;
    limit: z.ZodDefault<z.ZodNumber>;
    group_by: z.ZodDefault<z.ZodEnum<["file", "severity"]>>;
}, "strict", z.ZodTypeAny, {
    limit: number;
    severity_filter: "info" | "error" | "warning" | "hint" | "all";
    group_by: "file" | "severity";
}, {
    limit?: number | undefined;
    severity_filter?: "info" | "error" | "warning" | "hint" | "all" | undefined;
    group_by?: "file" | "severity" | undefined;
}>;
export declare const CompletionsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    limit: number;
}, {
    file_path: string;
    line: number;
    column: number;
    limit?: number | undefined;
}>;
export declare const RenameSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    new_name: z.ZodString;
    dry_run: z.ZodDefault<z.ZodBoolean>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    new_name: string;
    dry_run: boolean;
}, {
    file_path: string;
    line: number;
    column: number;
    new_name: string;
    dry_run?: boolean | undefined;
}>;
export declare const ServerStatusSchema: z.ZodObject<{
    server_id: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    server_id?: string | undefined;
}, {
    server_id?: string | undefined;
}>;
export declare const StartServerSchema: z.ZodObject<{
    server_id: z.ZodString;
    workspace_root: z.ZodEffects<z.ZodString, string, string>;
}, "strict", z.ZodTypeAny, {
    server_id: string;
    workspace_root: string;
}, {
    server_id: string;
    workspace_root: string;
}>;
export declare const StopServerSchema: z.ZodObject<{
    server_id: z.ZodString;
    workspace_root: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    server_id: string;
    workspace_root?: string | undefined;
}, {
    server_id: string;
    workspace_root?: string | undefined;
}>;
export declare const CodeActionsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    start_line: z.ZodNumber;
    start_column: z.ZodNumber;
    end_line: z.ZodOptional<z.ZodNumber>;
    end_column: z.ZodOptional<z.ZodNumber>;
    kinds: z.ZodOptional<z.ZodArray<z.ZodEnum<["quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports", "source.fixAll"]>, "many">>;
    apply: z.ZodDefault<z.ZodBoolean>;
    action_index: z.ZodOptional<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    start_line: number;
    start_column: number;
    apply: boolean;
    kinds?: ("quickfix" | "refactor" | "refactor.extract" | "refactor.inline" | "refactor.rewrite" | "source" | "source.organizeImports" | "source.fixAll")[] | undefined;
    end_line?: number | undefined;
    end_column?: number | undefined;
    action_index?: number | undefined;
}, {
    file_path: string;
    start_line: number;
    start_column: number;
    kinds?: ("quickfix" | "refactor" | "refactor.extract" | "refactor.inline" | "refactor.rewrite" | "source" | "source.organizeImports" | "source.fixAll")[] | undefined;
    end_line?: number | undefined;
    end_column?: number | undefined;
    apply?: boolean | undefined;
    action_index?: number | undefined;
}>;
export declare const CallHierarchySchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    direction: z.ZodDefault<z.ZodEnum<["incoming", "outgoing", "both"]>>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    direction: "incoming" | "outgoing" | "both";
}, {
    file_path: string;
    line: number;
    column: number;
    direction?: "incoming" | "outgoing" | "both" | undefined;
}>;
export declare const TypeHierarchySchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    direction: z.ZodDefault<z.ZodEnum<["supertypes", "subtypes", "both"]>>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    direction: "both" | "supertypes" | "subtypes";
}, {
    file_path: string;
    line: number;
    column: number;
    direction?: "both" | "supertypes" | "subtypes" | undefined;
}>;
export declare const FormatDocumentSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    tab_size: z.ZodDefault<z.ZodNumber>;
    insert_spaces: z.ZodDefault<z.ZodBoolean>;
    apply: z.ZodDefault<z.ZodBoolean>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    apply: boolean;
    tab_size: number;
    insert_spaces: boolean;
}, {
    file_path: string;
    apply?: boolean | undefined;
    tab_size?: number | undefined;
    insert_spaces?: boolean | undefined;
}>;
export declare const SmartSearchSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
    include: z.ZodDefault<z.ZodArray<z.ZodEnum<["definition", "references", "hover", "implementations", "incoming_calls", "outgoing_calls"]>, "many">>;
    references_limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
    include: ("definition" | "references" | "hover" | "implementations" | "incoming_calls" | "outgoing_calls")[];
    references_limit: number;
}, {
    file_path: string;
    line: number;
    column: number;
    include?: ("definition" | "references" | "hover" | "implementations" | "incoming_calls" | "outgoing_calls")[] | undefined;
    references_limit?: number | undefined;
}>;
export declare const FindSymbolSchema: z.ZodObject<{
    name: z.ZodString;
    file_path: z.ZodOptional<z.ZodEffects<z.ZodString, string, string>>;
    kind: z.ZodOptional<z.ZodEnum<["File", "Module", "Namespace", "Package", "Class", "Method", "Property", "Field", "Constructor", "Enum", "Interface", "Function", "Variable", "Constant", "String", "Number", "Boolean", "Array", "Object", "Key", "Null", "EnumMember", "Struct", "Event", "Operator", "TypeParameter"]>>;
    include: z.ZodDefault<z.ZodArray<z.ZodEnum<["definition", "references", "hover", "implementations", "incoming_calls", "outgoing_calls"]>, "many">>;
    references_limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    include: ("definition" | "references" | "hover" | "implementations" | "incoming_calls" | "outgoing_calls")[];
    references_limit: number;
    name: string;
    file_path?: string | undefined;
    kind?: "File" | "Module" | "Namespace" | "Package" | "Class" | "Method" | "Property" | "Field" | "Constructor" | "Enum" | "Interface" | "Function" | "Variable" | "Constant" | "String" | "Number" | "Boolean" | "Array" | "Object" | "Key" | "Null" | "EnumMember" | "Struct" | "Event" | "Operator" | "TypeParameter" | undefined;
}, {
    name: string;
    file_path?: string | undefined;
    include?: ("definition" | "references" | "hover" | "implementations" | "incoming_calls" | "outgoing_calls")[] | undefined;
    references_limit?: number | undefined;
    kind?: "File" | "Module" | "Namespace" | "Package" | "Class" | "Method" | "Property" | "Field" | "Constructor" | "Enum" | "Interface" | "Function" | "Variable" | "Constant" | "String" | "Number" | "Boolean" | "Array" | "Object" | "Key" | "Null" | "EnumMember" | "Struct" | "Event" | "Operator" | "TypeParameter" | undefined;
}>;
export type GotoDefinitionInput = z.infer<typeof GotoDefinitionSchema>;
export type GotoTypeDefinitionInput = z.infer<typeof GotoTypeDefinitionSchema>;
export type FindReferencesInput = z.infer<typeof FindReferencesSchema>;
export type FindImplementationsInput = z.infer<typeof FindImplementationsSchema>;
export type HoverInput = z.infer<typeof HoverSchema>;
export type SignatureHelpInput = z.infer<typeof SignatureHelpSchema>;
export type DocumentSymbolsInput = z.infer<typeof DocumentSymbolsSchema>;
export type WorkspaceSymbolsInput = z.infer<typeof WorkspaceSymbolsSchema>;
export type DiagnosticsInput = z.infer<typeof DiagnosticsSchema>;
export type WorkspaceDiagnosticsInput = z.infer<typeof WorkspaceDiagnosticsSchema>;
export type CompletionsInput = z.infer<typeof CompletionsSchema>;
export type RenameInput = z.infer<typeof RenameSchema>;
export type ServerStatusInput = z.infer<typeof ServerStatusSchema>;
export type StartServerInput = z.infer<typeof StartServerSchema>;
export type StopServerInput = z.infer<typeof StopServerSchema>;
export type CodeActionsInput = z.infer<typeof CodeActionsSchema>;
export type CallHierarchyInput = z.infer<typeof CallHierarchySchema>;
export type TypeHierarchyInput = z.infer<typeof TypeHierarchySchema>;
export type FormatDocumentInput = z.infer<typeof FormatDocumentSchema>;
export type SmartSearchInput = z.infer<typeof SmartSearchSchema>;
export type FindSymbolInput = z.infer<typeof FindSymbolSchema>;
export declare const FileExportsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    include_signatures: z.ZodDefault<z.ZodBoolean>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    include_signatures: boolean;
}, {
    file_path: string;
    include_signatures?: boolean | undefined;
}>;
export type FileExportsInput = z.infer<typeof FileExportsSchema>;
export declare const FileImportsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
}, {
    file_path: string;
}>;
export type FileImportsInput = z.infer<typeof FileImportsSchema>;
export declare const RelatedFilesSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    relationship: z.ZodDefault<z.ZodEnum<["imports", "imported_by", "all"]>>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    relationship: "all" | "imports" | "imported_by";
}, {
    file_path: string;
    relationship?: "all" | "imports" | "imported_by" | undefined;
}>;
export type RelatedFilesInput = z.infer<typeof RelatedFilesSchema>;
export declare const DocumentHighlightsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export type DocumentHighlightsInput = z.infer<typeof DocumentHighlightsSchema>;
export declare const InlayHintsSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    start_line: z.ZodNumber;
    start_column: z.ZodNumber;
    end_line: z.ZodNumber;
    end_column: z.ZodNumber;
    limit: z.ZodDefault<z.ZodNumber>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    limit: number;
    start_line: number;
    start_column: number;
    end_line: number;
    end_column: number;
}, {
    file_path: string;
    start_line: number;
    start_column: number;
    end_line: number;
    end_column: number;
    limit?: number | undefined;
}>;
export type InlayHintsInput = z.infer<typeof InlayHintsSchema>;
export declare const SelectionRangeSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    line: z.ZodNumber;
    column: z.ZodNumber;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    line: number;
    column: number;
}, {
    file_path: string;
    line: number;
    column: number;
}>;
export type SelectionRangeInput = z.infer<typeof SelectionRangeSchema>;
export declare const FoldingRangesSchema: z.ZodObject<{
    file_path: z.ZodEffects<z.ZodString, string, string>;
    kind_filter: z.ZodDefault<z.ZodEnum<["all", "comment", "imports", "region"]>>;
}, "strict", z.ZodTypeAny, {
    file_path: string;
    kind_filter: "all" | "imports" | "comment" | "region";
}, {
    file_path: string;
    kind_filter?: "all" | "imports" | "comment" | "region" | undefined;
}>;
export type FoldingRangesInput = z.infer<typeof FoldingRangesSchema>;
export declare const IndexFilesSchema: z.ZodObject<{
    files: z.ZodArray<z.ZodEffects<z.ZodString, string, string>, "many">;
}, "strict", z.ZodTypeAny, {
    files: string[];
}, {
    files: string[];
}>;
export type IndexFilesInput = z.infer<typeof IndexFilesSchema>;
//# sourceMappingURL=tool-schemas.d.ts.map