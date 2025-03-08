import { Checkbox } from "@/components/ui/checkbox"
import { Vendors[id] } from "@/types/chartofaccounts"
import { ColumnDef } from "@tanstack/react-table"

export const columns: ColumnDef<Vendors[id]>[] = [
  {
    id: "select",
    header: ({ table }) => (
      <Checkbox
        checked={
          table.getIsAllPageRowsSelected() ||
          (table.getIsSomePageRowsSelected() && "indeterminate")
        }
        onCheckedChange={(value) => table.toggleAllPageRowsSelected(!!value)}
        aria-label="Select all"
      />
    ),
    cell: ({ row }) => (
      <Checkbox
        checked={row.getIsSelected()}
        onCheckedChange={(value) => row.toggleSelected(!!value)}
        aria-label="Select row"
      />
    ),
    enableSorting: false,
    enableHiding: false,
  },
  {
    accessorKey: "accountName",
    header: "Account Name",
    cell: ({ row }) => <div>{row.getValue("accountName") || "N/A"}</div>,
  },
  {
    accessorKey: "accountType",
    header: "Account Type",
    cell: ({ row }) => <div>{row.getValue("accountType") || "N/A"}</div>,
  },
  {
    accessorKey: "accountCode",
    header: "Account Code",
    cell: ({ row }) => <div>{row.getValue("accountCode") || "N/A"}</div>,
  },
  {
    accessorKey: "description",
    header: "Description",
    cell: ({ row }) => <div>{row.getValue("description") || "N/A"}</div>,
  },
  {
    accessorKey: "createdDate",
    header: "Created Date",
    cell: ({ row }) => {
      const date = new Date(row.getValue("createdDate"))
      return <div>{date.toLocaleString()}</div>
    },
  },
  {
    accessorKey: "isActive",
    header: "Active",
    cell: ({ row }) => (
      <div>{row.getValue("isActive") ? "Yes" : "No"}</div>
    ),
  },
]


