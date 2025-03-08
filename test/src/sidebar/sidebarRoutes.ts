const sidebarRoutes = {
  versions: ["1.0.1"],
  navMain: [
    {
      title: "/chartofaccounts",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/chartofaccounts",
          isActive: true
        }
      ]
    }
,
    {
      title: "/chartofaccounts/[id]",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/chartofaccounts/[id]",
          isActive: false
        }
      ]
    }
,
    {
      title: "/customers",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/customers",
          isActive: true
        }
      ]
    }
,
    {
      title: "/customers/[id]",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/customers/[id]",
          isActive: false
        }
      ]
    }
,
    {
      title: "/invoices",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/invoices",
          isActive: true
        }
      ]
    }
,
    {
      title: "/invoices/[id]",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/invoices/[id]",
          isActive: false
        }
      ]
    }
,
    {
      title: "/vendors",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/vendors",
          isActive: true
        }
      ]
    }
,
    {
      title: "/vendors/[id]",
      url: "#",
      items: [
        {
          title: "View All",
          url: "/vendors/[id]",
          isActive: false
        }
      ]
    }
  ]
};
export default sidebarRoutes;
