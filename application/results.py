from dataclasses import dataclass, field


@dataclass
class PlansoftSyncSummary:
    files_found: int = 0
    groups_uploaded: int = 0
    failed: int = 0
    failed_groups: list[str] = field(default_factory=list)


@dataclass
class WcySyncSummary:
    groups_total: int = 0
    uploaded: int = 0
    skipped: int = 0
    failed: int = 0
    failed_groups: list[str] = field(default_factory=list)
