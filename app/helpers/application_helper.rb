module ApplicationHelper
  ICONS = {
    layout:   '<rect x="3" y="3" width="18" height="18" rx="3"/><path d="M3 9h18"/>',
    users:    '<circle cx="9" cy="8" r="3"/><path d="M3 20c0-3.3 2.7-6 6-6s6 2.7 6 6"/><circle cx="17" cy="9" r="2.5"/><path d="M17 14c2.2 0 4 1.8 4 4"/>',
    user_ok:  '<circle cx="10" cy="8" r="3.5"/><path d="M3 20c0-3.5 3-6 7-6M15 17l2 2 4-4"/>',
    user_x:   '<circle cx="10" cy="8" r="3.5"/><path d="M3 20c0-3.5 3-6 7-6M16 15l5 5M21 15l-5 5"/>',
    swap:     '<path d="M7 4 3 8l4 4M3 8h14M17 20l4-4-4-4M21 16H7"/>',
    message:  '<path d="M4 5h16v11H9l-5 4V5Z"/>',
    bag:      '<path d="M5 8h14l-1 12H6L5 8Z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/>',
    doc:      '<path d="M7 3h7l5 5v13H7V3Z"/><path d="M14 3v5h5M10 13h6M10 17h6"/>',
    trend:    '<path d="M3 3v18h18"/><path d="m7 15 4-4 3 3 5-6"/>',
    sparkles: '<path d="M9 4l1.5 4.5L15 10l-4.5 1.5L9 16l-1.5-4.5L3 10l4.5-1.5L9 4Z"/><path d="M18 14l.8 2.2L21 17l-2.2.8L18 20l-.8-2.2L15 17l2.2-.8L18 14Z"/>',
    settings: '<path d="M4 7h10M18 7h2M4 17h2M10 17h10"/><circle cx="16" cy="7" r="2"/><circle cx="8" cy="17" r="2"/>',
    shield:   '<path d="M12 3 4 6v6c0 5 3.5 8 8 9 4.5-1 8-4 8-9V6l-8-3Z"/>',
    help:     '<circle cx="12" cy="12" r="9"/><path d="M9.5 9.5a2.5 2.5 0 1 1 3.5 2.3c-.7.4-1 .9-1 1.7M12 17v.01"/>',
    gift:     '<rect x="3" y="8" width="18" height="4" rx="1"/><path d="M5 12v9h14v-9M12 8v13M12 8c-2 0-4-1-4-3s3-2 4 3c1-5 4-5 4-3s-2 3-4 3"/>',
    bell:     '<path d="M6 9a6 6 0 1 1 12 0c0 5 2 6 2 6H4s2-1 2-6Z"/><path d="M10 19a2 2 0 0 0 4 0"/>',
    plus:     '<circle cx="12" cy="12" r="9"/><path d="M12 8v8M8 12h8"/>',
    calendar: '<rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/>',
    filter:   '<path d="M4 6h16M7 12h10M10 18h4"/>',
    download: '<path d="M12 4v11m0 0-4-4m4 4 4-4M4 20h16"/>',
    search:   '<circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/>',
    info:     '<circle cx="12" cy="12" r="9"/><path d="M12 11v5M12 8v.01"/>',
    chevron:  '<path d="m6 9 6 6 6-6"/>',
    updown:   '<path d="m8 9 4-4 4 4M8 15l4 4 4-4"/>',
    collapse: '<path d="M5 5v14M19 12H9m0 0 4-4m-4 4 4 4"/>',
    dots:     '<circle cx="12" cy="5" r="1"/><circle cx="12" cy="12" r="1"/><circle cx="12" cy="19" r="1"/>',
    arrow_up: '<path d="M7 17 17 7M8 7h9v9"/>',
    arrow_dn: '<path d="M7 7l10 10M17 8v9H8"/>'
  }.freeze

  AVATAR_COLORS = [
    "bg-[#EEEBFF] text-[#5347CE]", "bg-teal-50 text-teal-700",
    "bg-[#E6F0FF] text-[#2F6FD8]", "bg-[#F1EEFF] text-[#6C60E8]",
    "bg-amber-50 text-amber-700",  "bg-rose-50 text-rose-600"
  ].freeze

  def icon(name, css: "h-5 w-5")
    %(<svg class="#{css}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">#{ICONS.fetch(name)}</svg>).html_safe
  end

  def avatar_classes(user)
    AVATAR_COLORS[user.id % AVATAR_COLORS.size]
  end
end
